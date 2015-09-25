class ModifyUnitsSchema < ActiveRecord::Migration
  def change
    add_reference :units, :provider, index: true
    add_column :product_units, :amount, :integer
  end
end
