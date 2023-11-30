# frozen_string_literal: true

class AddCreoleToSitewideTextItems < ActiveRecord::Migration[6.0]
  def change
    add_column :sitewide_text_items, :cr, :text
  end
end
