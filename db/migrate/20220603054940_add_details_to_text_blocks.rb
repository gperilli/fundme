class AddDetailsToTextBlocks < ActiveRecord::Migration[6.0]
  def change
    add_column :text_blocks, :en, :text
    add_column :text_blocks, :es, :text
    add_column :text_blocks, :pt, :text
    add_column :text_blocks, :cr, :text
  end
end
