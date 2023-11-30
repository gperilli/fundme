# frozen_string_literal: true

class AddSubscriptionStageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subscription_stage, :integer
  end
end
