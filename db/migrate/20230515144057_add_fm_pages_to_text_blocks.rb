# frozen_string_literal: true

class AddFmPagesToTextBlocks < ActiveRecord::Migration[6.0]
  def change
    add_reference :text_blocks, :fmpage, null: false, foreign_key: true
  end
end
