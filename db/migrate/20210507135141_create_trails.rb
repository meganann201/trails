class CreateTrails < ActiveRecord::Migration[6.1]
  def change
    create_table :trails do |t|
      t.references :park, null: false, foreign_key: true

      t.text :short_description
      t.text :long_description
      t.boolean :is_reservation_required
      t.string :season
      t.string :topics
      t.string :time_of_day_description
      t.text :location_description
      t.text :pets_description
      t.text :duration_description
      t.decimal :latitude
      t.text :activity_description
      t.string :activities
      t.string :url
      t.decimal :longitude
      t.text :reservation_description
      t.boolean :are_pets_permitted
      t.string :duration
      t.string :related_organizations
      t.string :location
      t.string :fee_description
      t.boolean :do_fees_apply
      t.string :title
      t.string :images
      t.string :time_of_day
      t.string :tags
      t.string :season_description
      t.integer :nps_things_to_do_id
      t.boolean :are_pets_permitted_with_restrictions
      t.string :age_description
      t.string :related_parks
      t.text :accessibility_information
      t.string :age
      t.timestamps
    end
  end
end
