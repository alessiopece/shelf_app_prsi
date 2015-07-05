class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.string :genre
      t.references :shelf, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
