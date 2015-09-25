class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.references :provider, index: true
      t.references :category, index: true
      t.boolean :active

      t.timestamps
    end
  end
end
