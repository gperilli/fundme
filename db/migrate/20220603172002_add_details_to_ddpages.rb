class AddDetailsToDdpages < ActiveRecord::Migration[6.0]
  def change
    add_column :ddpages, :en, :string
    add_column :ddpages, :es, :string
    add_column :ddpages, :pt, :string
    add_column :ddpages, :cr, :string
  end
end
