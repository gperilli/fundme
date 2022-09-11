class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :donations, :type, :donation_type
  end
end
