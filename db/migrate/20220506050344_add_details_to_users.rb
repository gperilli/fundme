class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :user_number, :string
    add_column :users, :uid, :string
  end
end
