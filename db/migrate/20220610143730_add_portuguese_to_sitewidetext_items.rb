class AddPortugueseToSitewidetextItems < ActiveRecord::Migration[6.0]
  def change
    add_column :sitewide_text_items, :pt, :text
  end
end
