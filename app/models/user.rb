class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :validatable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :confirmable, :validatable ,
         :email_regexp =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  attr_accessible :name, :email, :subdomain, 
      :password, :password_confirmation, :remember_me, 
      :welcome_phrase, :thankyou_phrase, :calendar

  # before each user is created:
  before_create :set_temporary_name
  before_create :set_temporary_subdomain
   
  # Variables
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  subdomain_regex = /^[A-Za-z0-9-]+$/
  forbidden_subdomains = %w( support blog www billing help api )
  
  # validations:
  validates :email, presence: true,
              format: { with: email_regex },
              uniqueness: { case_sensitive: false }

  validates :subdomain, presence: true, on: :update,
              allow_blank: true,
              uniqueness: { case_sensitive: false },
              format: { with: subdomain_regex, 
                message: "The subdomain can only contain numbers, 
                          letters, and dashes" }
     
  validates_exclusion_of :subdomain, in: forbidden_subdomains, 
                                  message: "reserved and unavailable"   
    
  has_many :thankyous,          :dependent    => :destroy,
                                :foreign_key  => "thanker_id"
  has_many :welcomes,           :dependent    => :destroy,
                                :foreign_key  => "welcomer_id",
                                :class_name   => "Thankyou"
  has_many :thanked,            :through      => :thankyous,
                                :source       => :welcomer
  has_many :welcomed,           :through      => :welcomes,
                                :source       => :thanker

  def thanked?(welcomer)
    thankyous.find_by_welcomer_id(welcomer)
  end

  def thank!(welcomer)
    thankyous.create!(:welcomer_id => welcomer.id)
  end

  def unthank!(welcomer)
    thankyous.find_by_welcomer_id(welcomer).destroy
  end

  def welcomed?(thanker)
    welcomes.find_by_thanker_id(thanker)
  end

  def password_match?
    self.errors[:password] << 'mismatch' if password != password_confirmation
    self.errors[:password] << 'blank!' if password.blank?
    password == password_confirmation and !password.blank?
  end

  def temporary_name(email)
    email_split = email.split('@')
    email_local = email_split[0]
    local_spaced = email_local.split('.').join(' ')
    temporary_name = local_spaced.titleize
  end
  
  def set_temporary_name
    email = self.email
    email_split = email.split('@')
    email_local = email_split[0]
    local_spaced = email_local.split('.').join(' ')
    self.name = local_spaced.titleize
  end

  def set_temporary_subdomain
    email = self.email
    email_split   = email.split('@')
    email_local   = email_split[0]
    local_dashed  = email_local.split('.').join('-')
    if User.find_by_subdomain(local_dashed).nil?
      self.subdomain = local_dashed
    else
      self.subdomain = "#{local_dashed}-#{subdomain_placeholder}"    
    end  
    end
        

  def subdomain_placeholder
    modifiers  = ["uber", "way", "total", "hardcore", "way", "total", "heavy", "magma", "hoopla", "hot", "cold"]
    adjectives = ["cool", "hot", "awesome", "rockstar", "supafly", "dope", "perspicacious"]
    subdomain_placeholder = "#{modifiers.sample}-#{adjectives.sample}"
  end

  protected    
      
end

