class Activity < ApplicationRecord
  belongs_to :park, optional: true
  has_and_belongs_to_many :tags

  serialize :season, Array
  serialize :topics, Array
  serialize :activities, Array
  serialize :addresses, Array
  serialize :related_organizations, Array
  serialize :images, Array
  serialize :time_of_day, Array
  serialize :tags, Array
  serialize :related_parks, Array


  scope :hikes, -> { joins(:tags).where('tags.value LIKE ?', '%hik%') }
  scope :pet_friendly, -> { where('are_pets_permitted = true') }
  scope :climbs, -> { joins(:tags).where('tags.value IN (?)', ['climbing', 'Rock Climbing', 'Boulder Climbing']) }
  scope :camping, -> { joins(:tags).where('LOWER(tags.value) LIKE ? AND NOT LOWER(tags.value) like ? AND NOT LOWER(tags.value) like ?', '%camp%', '%campaign%', '%encampment%') }
  scope :biking, -> { joins(:tags).where('tags.value LIKE ?', '%bik%') }
  
end
