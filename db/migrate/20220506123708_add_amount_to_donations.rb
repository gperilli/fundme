# frozen_string_literal: true

class AddAmountToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :amount, :integer
  end
end
