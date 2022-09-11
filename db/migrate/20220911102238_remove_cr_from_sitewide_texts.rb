class RemoveCrFromSitewideTexts < ActiveRecord::Migration[6.0]
  def change
    remove_column :sitewide_texts, :cr, :text
  end
end
