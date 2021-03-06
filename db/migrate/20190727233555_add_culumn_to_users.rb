class AddCulumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, unique: true
    add_column :users, :admin, :boolean, default: false, null: false
    add_reference :items, :user, foreign_key: true

  end
end
