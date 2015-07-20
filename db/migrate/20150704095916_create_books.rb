class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :year
      t.string :genre
      t.references :shelf, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
