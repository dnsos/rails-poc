class AddSlugToFocusGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :focus_groups, :slug, :string
    add_index :focus_groups, :slug, unique: true
  end
end
