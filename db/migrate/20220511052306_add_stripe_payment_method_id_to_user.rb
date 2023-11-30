# frozen_string_literal: true

class AddStripePaymentMethodIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stripe_payment_method_id, :string
  end
end
