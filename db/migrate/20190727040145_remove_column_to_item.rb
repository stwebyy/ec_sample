class RemoveColumnToItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :review
  end
end
