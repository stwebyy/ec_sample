class AddColomn < ActiveRecord::Migration[5.2]
  def change
    add_reference :rates, :item, index: true, foreign_key: true
    add_reference :itemreviews, :item, index: true, foreign_key: true
    add_reference :items, :category, index: true, foreign_key: true
  end
end
