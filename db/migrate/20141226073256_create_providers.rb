class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :company_name
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :city
      t.string :phone
      t.string :email
      t.string :logo_url
      t.string :website
      t.boolean :active

      t.timestamps
    end
  end
end
