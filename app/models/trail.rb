class Trail < ApplicationRecord
  belongs_to :park

  serialize :season, Array
  serialize :topics, Array
  serialize :activities, Array
  serialize :addresses, Array
  serialize :related_organizations, Array
  serialize :images, Array
  serialize :time_of_day, Array
  serialize :tags, Array
  serialize :related_parks, Array
  
end
