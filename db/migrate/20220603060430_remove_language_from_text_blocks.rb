# frozen_string_literal: true

class RemoveLanguageFromTextBlocks < ActiveRecord::Migration[6.0]
  def change
    remove_column :text_blocks, :language, :integer
  end
end
