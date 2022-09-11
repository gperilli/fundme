class RemoveTextBlockFromTextBlocks < ActiveRecord::Migration[6.0]
  def change
    remove_column :text_blocks, :text_block, :text
  end
end
