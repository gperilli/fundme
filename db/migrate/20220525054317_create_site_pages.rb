# frozen_string_literal: true

class CreateSitePages < ActiveRecord::Migration[6.0]
  def change
    create_table :site_pages do |t|
      t.string :title
      t.boolean :published

      t.timestamps
    end
  end
end
