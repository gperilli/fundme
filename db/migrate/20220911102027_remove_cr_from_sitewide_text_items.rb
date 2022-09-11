class RemoveCrFromSitewideTextItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :sitewide_text_items, :cr, :text
  end
end
