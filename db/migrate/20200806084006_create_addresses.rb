class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, default: "", null: false
      t.integer :prefecture, null: false
      t.string :city, default: "", null: false
      t.string :address_line, default: "", null: false
      t.string :building_unit
      t.string :phone_number, default: "", null: false
      t.timestamps
    end
  end
end
