class DropItemReview < ActiveRecord::Migration[5.2]
  def up
    drop_table :item_reviews
  end
  def down
    create_table :item_reviews do |t|
      t.text :review, comment: "商品レビュー", null: false, :unique => true
    end
  end
end