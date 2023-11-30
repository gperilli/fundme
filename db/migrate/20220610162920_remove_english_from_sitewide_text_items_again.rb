# frozen_string_literal: true

class RemoveEnglishFromSitewideTextItemsAgain < ActiveRecord::Migration[6.0]
  def change
    remove_column :sitewide_text_items, :english, :text
  end
end
