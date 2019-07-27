class AddColomn < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :item, index: true, foreign_key: true
    add_reference :rates, :item, index: true, foreign_key: true
    add_reference :itemreviews, :item, index: true, foreign_key: true
    add_reference :items, :shop, index: true, foreign_key: true
    add_reference :users, :shop, index: true, foreign_key: true, null: true
  end
end
