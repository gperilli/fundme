class AddSubscriptionFrequencyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subscription_frequency, :string
  end
end
