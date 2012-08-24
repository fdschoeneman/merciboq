class Bond < ActiveRecord::Base
  attr_accessible :dominant_id

  validates :dominant_id, :submissive_id, presence: true
end
