class AddColomn < ActiveRecord::Migration[5.2]
  def change
    add_reference :item_reviews, :item, index: true, foreign_key: true
  end
end
