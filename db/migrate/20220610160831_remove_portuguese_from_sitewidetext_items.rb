# frozen_string_literal: true

class RemovePortugueseFromSitewidetextItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :sitewide_text_items, :portuguese, :text
  end
end
