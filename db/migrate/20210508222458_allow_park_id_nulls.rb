class AllowParkIdNulls < ActiveRecord::Migration[6.1]
  def change
    change_column_null :trails, :park_id, true
  end
end
