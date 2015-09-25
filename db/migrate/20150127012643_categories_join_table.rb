class CategoriesJoinTable < ActiveRecord::Migration
  def change
    add_reference :categories, :provider, index: true
    add_column :categories, :parent_id, :integer
    add_index :categories, :parent_id
    add_column :categories, :product_count, :integer
    add_column :categories, :description, :string
    
    create_table :categories_products, :id => false do |t|
      t.references :product, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
