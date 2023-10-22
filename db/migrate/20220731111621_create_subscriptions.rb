class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :status
      t.string :subscription_frequency
      t.integer :subscription_stage
      t.integer :monthly_subscription_term
      t.integer :monthly_subscription_amount
      t.integer :yearly_subscription_amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
