class RemoveFocusGroupsFromFacility < ActiveRecord::Migration[7.0]
  def change
    change_table :facilities do |t|
      t.remove :focus_groups
    end
  end
end
