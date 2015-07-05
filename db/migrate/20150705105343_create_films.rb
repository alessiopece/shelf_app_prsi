class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.integer :year
      t.string :genre
      t.references :shelf, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
