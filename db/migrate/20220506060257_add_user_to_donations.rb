# frozen_string_literal: true

class AddUserToDonations < ActiveRecord::Migration[6.0]
  def change
    add_reference :donations, :user, null: false, foreign_key: true
  end
end
