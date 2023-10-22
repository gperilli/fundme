class ChangeSubscriptionSetNumberInDonations < ActiveRecord::Migration[6.0]
  def change
    change_column :donations, :subscription_set_number, :integer, :default => 0
  end
end
