# frozen_string_literal: true

class CreateSitewideTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :sitewide_texts do |t|
      t.string :name
      t.text :en
      t.text :es
      t.text :pt
      t.text :cr

      t.timestamps
    end
  end
end
