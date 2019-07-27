class CreateItemReview < ActiveRecord::Migration[5.2]
  def change
    create_table :item_reviews do |t|
      t.text :review, comment: "商品レビュー", null: false, :unique => true
    end
  end
end
