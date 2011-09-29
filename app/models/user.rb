class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :validatable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :confirmable
         #, :validatable,
         #:email_regexp =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :subdomain,
                  :password, :password_confirmation, :remember_me,
                  :welcome_phrase, :thankyou_phrase

  # Email validations:
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => true

#  validates :password,              :presence => true,
#                                    :confirmation => true,
#                                    :on => :create
#  validates :password_confirmation, :presence => true,
#                                    :on => :create
#  validates :current_password,      :presence => true,
#                                    :on => :update

#  validates_uniqueness_of :name, :email, :case_sensitive => false

#  validates_presence_of :subdomain
#  validates_format_of :subdomain, :with => /^[A-Za-z0-9-]+$/,
#    :message => 'The subdomain can only contain alphanumeric characters
#     and dashes.',
#    :allow_blank => true
#  validates_uniqueness_of :subdomain, :case_sensitive => false

#  before_validation :downcase_subdomain

#  validates_exclusion_of :subdomain,
#    :in => %w( support blog www billing help api ),
#    :message => "The subdomain <strong>{{value}}</strong>
#    is reserved and unavailable."

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

  protected

    def downcase_subdomain
      self.subdomain.downcase! if attribute_present?("subdomain")
    end

end

