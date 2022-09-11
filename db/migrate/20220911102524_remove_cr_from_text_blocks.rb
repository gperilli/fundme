class RemoveCrFromTextBlocks < ActiveRecord::Migration[6.0]
  def change
    remove_column :text_blocks, :cr, :text
  end
end
