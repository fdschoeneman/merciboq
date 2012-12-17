class Merciboku < ActiveRecord::Base

  attr_accessible :content, :headline, :thanker_id, :welcomer_id

  belongs_to :thanker,    class_name: "User"
  belongs_to :welcomer,   class_name: "User"
  has_many :attachments

  validates :thanker_id,  presence: true
  validates :welcomer_id, presence: true
  validates :content,     presence: true
  validates :headline,    presence: true

  default_scope order: 'mercibokus.created_at DESC'

end

