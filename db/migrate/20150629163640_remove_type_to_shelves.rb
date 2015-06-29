class RemoveTypeToShelves < ActiveRecord::Migration
  def change
	remove_column :shelves, :type, :text
	add_column :shelves, :type, :string
	
  end
end
