class Bond < ActiveRecord::Base
  attr_accessible :dominant_id

  belongs_to :subordinate,  class_name: "User"
  belongs_to :dominant,     class_name: "User"

  validates :dominant_id,   presence: true
  validates :subordinate_id, presence: true

end
