class Thankyou < ActiveRecord::Base

  attr_accessible :thanker_id, :welcomer_id, :content, :headline,
                  :created_at, :updated_at

  belongs_to :thanker,    :class_name => "User"
  belongs_to :welcomer,   :class_name => "User"

  validates :thanker_id,  :presence => true
  validates :welcomer_id, :presence => true
  validates :content,     :presence => true
  validates :headline,    :presence => true

  default_scope :order => 'thankyous.created_at DESC'


end

