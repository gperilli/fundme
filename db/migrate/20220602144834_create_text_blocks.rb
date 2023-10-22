class CreateTextBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :text_blocks do |t|
      t.string :title
      t.integer :language
      t.text :text_block
      t.integer :order

      t.timestamps
    end
  end
end
