class CreateFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :facilities do |t|
      t.string :title
      t.string :provider
      t.string :service
      t.string :focus_groups, array: true, default: []
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :phone
      t.string :email
      t.string :website
      t.decimal :latitude
      t.decimal :longitude
      t.string :district

      t.timestamps
    end
  end
end
