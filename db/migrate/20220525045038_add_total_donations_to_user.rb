# frozen_string_literal: true

class AddTotalDonationsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :total_donations, :integer, default: 0
  end
end
