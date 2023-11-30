# frozen_string_literal: true

class DropSitePagesTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :site_pages
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
