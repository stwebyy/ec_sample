class CreateCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, comment: "カテゴリ名", null: false, :unique =>  true
    end
  end
end
