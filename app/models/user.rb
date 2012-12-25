class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :confirmable, :validatable #,

  attr_accessible :name, :subdomain, :email, :business_name,  
    :hours_of_operation, :web_address, :address_1, :address_2, :city, :state,
    :zip_code, :phone, :welcome_phrase, :thankyou_phrase, :calendar,
    :public_email, :password, :password_confirmation, :remember_me

  before_create :set_temporary_name
  before_create :set_temporary_subdomain
   
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  subdomain_regex = 
    /^([a-z0-9]([_\-](?![_\-])|[a-z0-9]){0,61}[a-z0-9]|[a-z0-9])$/i 
  
  forbidden_subdomains = %w( support blog www billing help api 
    merciboku privacy help legal terms blog )
  
  validates :email, presence: true, 
                    format: { with: email_regex },
                    uniqueness: { case_sensitive: false }

  validates :subdomain, presence: true, on: :update
  validates :subdomain, uniqueness: { case_sensitive: false },
              format: { with: subdomain_regex, message: 
                "The subdomain can only contain numbers, 
                letters, and dashes" },
              allow_blank: true
     
  validates_exclusion_of :subdomain, in: forbidden_subdomains, 
     message: "reserved and unavailable"   

  has_many :thankyous,          dependent: :destroy,
                                foreign_key: "thanker_id",
                                class_name: "Merciboku"
  has_many :welcomes,           dependent: :destroy,
                                foreign_key: "welcomer_id",
                                class_name: "Merciboku"
  has_many :thanked,            through: :thankyous,
                                source: :welcomer
  has_many :welcomed,           through: :welcomes,
                                source: :thanker
  has_many :subordinate_bonds,  class_name: "Bond",
                                foreign_key: "subordinate_id", 
                                dependent: :destroy
  has_many :dominant_bonds,     class_name: "Bond",
                                foreign_key: "dominant_id", 
                                dependent: :destroy
  has_many :subordinates,       through: :dominant_bonds,
                                dependent: :destroy
  has_many :dominants,          through: :subordinate_bonds,
                                dependent: :destroy

  def thanked?(welcomer)
    thankyous.find_by_welcomer_id(welcomer)
  end

  def welcomed?(thanker)
    welcomes.find_by_thanker_id(thanker)
  end

  def subordinate_to?(dominant_user)
    subordinate_bonds.find_by_dominant_id(dominant_user.id)
  end

  def submit!(dominant_user)
    subordinate_bonds.create!(dominant_id: dominant_user.id)
  end

  def emancipate!(dominant_user)
    subordinate_bonds.find_by_dominant_id(dominant_user).destroy
  end

  def password_match?
    self.errors[:password] << 'mismatch' if password != password_confirmation
    self.errors[:password] << 'blank!' if password.blank?
    password == password_confirmation and !password.blank?
  end

  def set_temporary_name
    self.name = self.email.split('@').first.gsub('.', ' ').titleize
  end

  def set_temporary_subdomain

    local_dashed = self.email.split('@').first.gsub(/[.+]/, '-').dasherize
    if User.find_by_subdomain(local_dashed).nil?
      self.subdomain = local_dashed
    else
      self.subdomain = "#{local_dashed}-#{subdomain_placeholder}"    
    end  
  end
        
  def subdomain_placeholder
    modifiers  = ["uber", "way", "total", "hardcore", "way", "total", "heavy", "magma", "hoopla", "hot", "cold"]
    adjectives = ["cool", "hot", "awesome", "rockstar", "supafly", "dope", "perspicacious"]
    random_subdomain_number = SecureRandom.random_number(1000)
    subdomain_placeholder = "#{modifiers.sample}-#{adjectives.sample}-#{random_subdomain_number}"
  end

end

