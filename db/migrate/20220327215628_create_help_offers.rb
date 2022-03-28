class CreateHelpOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :help_offers do |t|
      t.belongs_to :facility, null: false, foreign_key: true
      t.belongs_to :focus_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
