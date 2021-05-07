class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trail, null: false, foreign_key: true

      t.sting :title
      t.text :body
      t.integer :rating 
      t.timestamps
    end
  end
end
