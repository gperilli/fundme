class AddSpanishToSitewidetextItems < ActiveRecord::Migration[6.0]
  def change
    add_column :sitewide_text_items, :es, :text
  end
end
