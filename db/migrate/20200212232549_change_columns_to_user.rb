class ChangeColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :provider, :boolean, null: false
    change_column :users, :uid, :boolean, null: false
  end
    add_index :users, [:provider, :uid], unique: true
end
