class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.references :shelf, index: true, foreign_key: true
      t.string :category

      t.timestamps null: false
    end
  end
end
