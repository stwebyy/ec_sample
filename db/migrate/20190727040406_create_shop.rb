class CreateShop < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, comment: "店舗名", null: false, :unique => true, limit: 40
      t.string :address, comment: "住所", null: false
      t.integer :telephone, comment: "電話番号", null: false, :unique => true
      t.string :person, comment: "責任者", defalt: false, null: false, :unique => true
      t.boolean :hide, comment: "表示・非表示", defalt: false, null: false

      t.timestamps
    end
  end
end
