class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false
      t.string :item_name, null: false
      t.text :item_detail, null: false
      t.integer :item_category_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :covered_shipping_by_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :days_til_ship_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
    add_foreign_key :items, :users, column: :user_id
  end
end
