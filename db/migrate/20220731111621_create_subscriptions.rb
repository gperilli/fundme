class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :status
      t.string :subscription_frequency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
