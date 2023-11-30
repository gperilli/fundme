# frozen_string_literal: true

class CreateSubscriptionParameters < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_parameters do |t|
      t.integer :monthly_subscription_term
      t.integer :monthly_subscription_amount
      t.integer :yearly_subscription_amount
      t.boolean :active
      t.timestamps
    end
  end
end
