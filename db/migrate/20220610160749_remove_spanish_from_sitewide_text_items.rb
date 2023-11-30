# frozen_string_literal: true

class RemoveSpanishFromSitewideTextItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :sitewide_text_items, :spanish, :text
  end
end
