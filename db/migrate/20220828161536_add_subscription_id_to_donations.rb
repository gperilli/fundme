class AddSubscriptionIdToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :subscription_id, :string
  end
end
