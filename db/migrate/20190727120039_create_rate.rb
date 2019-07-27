class CreateRate < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :high_rate, comment: "高評価", default: 0, null: false
      t.integer :low_rate, comment: "低評価", default: 0, null: false

      t.timestamps
    end
  end
end
