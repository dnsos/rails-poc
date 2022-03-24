class CreateFocusGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :focus_groups do |t|
      t.string :label

      t.timestamps
    end
  end
end
