class Park < ApplicationRecord
  serialize :addresses, Array
  serialize :entrance_fees, Array
  serialize :topics, Array
  serialize :activities, Array
  serialize :operating_hours, Array
  serialize :contacts, Hash
  serialize :entrance_passes, Array
  serialize :images, Array
end
