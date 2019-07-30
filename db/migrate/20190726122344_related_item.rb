# frozen_string_literal: true

class RelatedItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, comment: "商品名", null: false, :unique =>  true, limit: 50
      t.integer :stocks, comment: "在庫数", default: 0, null: false
      t.text :description, comment: "商品説明", null: false, :unique => true
      t.boolean :hide, comment: "表示・非表示", defalt: false, null: false
      t.text :review, comment: "商品レビュー", limit: 200
      t.integer :price, comment: "価格", null: false

      t.timestamps
    end
  end
end
