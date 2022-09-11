class AddSubscriptionStatusToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :subscription_status, :string
  end
end
