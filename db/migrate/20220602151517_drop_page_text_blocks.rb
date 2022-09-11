class DropPageTextBlocks < ActiveRecord::Migration[6.0]
  def change
    drop_table :page_text_blocks
  end
end
