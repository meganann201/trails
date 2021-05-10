class CreateJoinTableActivitiesTags < ActiveRecord::Migration[6.1]
  def change
    create_join_table :activities, :tags do |t|
      t.index [:activity_id, :tag_id]
    end
  end
end
