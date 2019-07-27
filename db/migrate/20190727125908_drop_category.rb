class DropCategory < ActiveRecord::Migration[5.2]
  def up
    drop_table :categories
  end
  def down
    create_table :categories do |t|
      t.string :name, comment: "カテゴリ名", null: false, :unique =>  true
    end
  end
end
