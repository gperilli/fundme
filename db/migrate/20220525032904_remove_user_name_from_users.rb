# frozen_string_literal: true

class RemoveUserNameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :user_name, :string
  end
end
