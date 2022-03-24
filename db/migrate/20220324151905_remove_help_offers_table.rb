class RemoveHelpOffersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :help_offers
  end
end
