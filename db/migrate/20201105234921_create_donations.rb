# frozen_string_literal: true

class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.string :title
      t.integer :price
      t.string :stripe_payment_id
      t.string :status

      t.timestamps
    end
  end
end
