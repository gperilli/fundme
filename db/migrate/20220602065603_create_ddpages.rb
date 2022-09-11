class CreateDdpages < ActiveRecord::Migration[6.0]
  def change
    create_table :ddpages do |t|
      t.string :title
      t.boolean :is_published

      t.timestamps
    end
  end
end
