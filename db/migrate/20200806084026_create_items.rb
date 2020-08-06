class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false
      t.references :address, null: false, foreign_key: true
      t.string :item_name, null: false
      t.text :item_detail, null: false
      t.integer :item_category, null: false
      t.integer :item_condition, null: false
      t.integer :covered_shipping_by, null: false
      t.integer :ship_from_location, null: false
      t.integer :days_til_ship, null: false
      t.integer :price, null: false
      t.timestamps
    end
    add_foreign_key :items, :users, column: :user_id
  end
end
