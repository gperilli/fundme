class RemoveCrFromDdpages < ActiveRecord::Migration[6.0]
  def change
    remove_column :ddpages, :cr, :text
  end
end
