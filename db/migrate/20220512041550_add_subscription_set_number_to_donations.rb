# frozen_string_literal: true

class AddSubscriptionSetNumberToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :subscription_set_number, :integer
  end
end
