class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :store_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :address
      t.string :city
      t.boolean :active

      t.timestamps
    end
  end
end
