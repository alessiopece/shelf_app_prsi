class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.references :user, index: true, foreign_key: true
      t.text :type

      t.timestamps null: false
    end
    add_index :shelves, [:user_id, :created_at]
  end
end
