# frozen_string_literal: true

class AddMoreDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :other_names, :string
  end
end
