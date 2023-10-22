class CreatePageTextBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :page_text_blocks do |t|
      t.string :title
      t.string :language
      t.string :text_block
      t.references :site_page

      t.timestamps
    end
  end
end
