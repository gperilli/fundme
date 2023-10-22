class CreateFmpages < ActiveRecord::Migration[6.0]
  def change
    create_table :fmpages do |t|
      t.string :title
      t.boolean :is_published

      t.string :en
      t.string :es
      t.string :pt
      t.string :cr

      t.timestamps
    end
  end
end
