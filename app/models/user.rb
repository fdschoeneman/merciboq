class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :validatable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :confirmable
         #, :validatable,
         #:email_regexp =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :welcome_phrase,
                  :password, :password_confirmation, :remember_me

  # Validations:
#  validates_email :email
#  validates :email,                 :presence => true,
#                                    :uniqueness => true
#  validates :password,              :presence => true,
#                                    :confirmation => true,
#                                    :on => :create
#  validates :password_confirmation, :presence => true,
#                                    :on => :create
#  validates :current_password,      :presence => true,
#                                    :on => :update

#  validates_uniqueness_of :name, :email, :case_sensitive => false

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

  def thank!(welcomer, content)
    thankyous.create!(:welcomer_id => welcomer.id,
                      :content => content,
                      :headline => headline)
  end

  def unthank!(welcomer)
    thankyous.find_by_welcomer_id(welcomer).destroy
  end

  def welcomed?(thanker)
    welcomes.find_by_thanker_id(thanker)
  end

end

