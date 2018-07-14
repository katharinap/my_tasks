class AddIconColorToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :icon_color, :integer, default: 0
  end
end
