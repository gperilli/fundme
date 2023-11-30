# frozen_string_literal: true

class ChangeSubscriptionStageInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :subscription_stage, :integer, default: 0
  end
end
