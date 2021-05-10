class RemoveTagStringFromActivity < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :tags
  end
end
