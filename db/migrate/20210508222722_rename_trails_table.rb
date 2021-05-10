class RenameTrailsTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :trails, :activities
  end
end
