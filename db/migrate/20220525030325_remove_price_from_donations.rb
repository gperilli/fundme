# frozen_string_literal: true

class RemovePriceFromDonations < ActiveRecord::Migration[6.0]
  def change
    remove_column :donations, :price, :integer
  end
end
