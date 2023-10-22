class RemoveCreoleFromSitewideTextItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :sitewide_text_items, :creole, :text
  end
end
