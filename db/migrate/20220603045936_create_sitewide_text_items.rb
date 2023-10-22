class CreateSitewideTextItems < ActiveRecord::Migration[6.0]
  def change
    create_table :sitewide_text_items do |t|
      t.string :name
      t.text :english
      t.text :spanish
      t.text :portuguese
      t.text :creole

      t.timestamps
    end
  end
end
