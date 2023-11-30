# frozen_string_literal: true

class AddTypeToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :type, :string
  end
end
