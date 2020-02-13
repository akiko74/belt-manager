class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string, null: false
    add_column :users, :uid, :string, null: false
    add_column :users, :name, :string
    add_index :users, [:provider, :uid], unique: true
  end
end
