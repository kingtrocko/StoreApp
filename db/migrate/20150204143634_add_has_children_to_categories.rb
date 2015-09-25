class AddHasChildrenToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :has_children, :boolean
  end
end
