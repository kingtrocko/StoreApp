class CreateProductUnits < ActiveRecord::Migration
  def change
    create_table :product_units do |t|
      t.references :product, index: true
      t.references :unit, index: true
      t.decimal :price, precision: 8, scale: 2
      t.string :description

      t.timestamps
    end
  end
end
