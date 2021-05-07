class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      t.string :states
      t.text :weather_info
      t.text :direction_info
      t.string :addresses
      t.string :entrance_fees
      t.string :topics
      t.string :name
      t.decimal :latitude
      t.string :activities
      t.string :operating_hours
      t.string :url
      t.decimal :longitude
      t.string :contacts
      t.string :entrance_passes
      t.string :park_code
      t.string :designation
      t.string :images
      t.string :full_name
      t.integer :nps_park_id
      t.string :directions_url
      t.text :description
      t.timestamps
    end
  end
end
