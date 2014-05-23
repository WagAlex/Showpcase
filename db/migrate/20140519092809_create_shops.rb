class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.string :street_address
      t.string :zipcode
      t.string :city
      t.string :country
      t.integer :price

      t.timestamps
    end
  end
end
