class CreateItemReview < ActiveRecord::Migration[5.2]
  def change
    create_table :itemreviews do |t|
      t.text :review, comment: "商品レビュー", :unique => true

      t.timestamps
    end
  end
end
