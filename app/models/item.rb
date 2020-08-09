class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name, length: {maximum: 40}
    validates :item_detail, length: {maximum: 1000}
    validates :item_category_id
    validates :item_condition_id
    validates :covered_shipping_by_id
    validates :ship_from_location_id
    validates :days_til_ship_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999   }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :item_category
    belongs_to_active_hash :item_condition
    belongs_to_active_hash :covered_shipping_by
    belongs_to_active_hash :ship_from_location
    belongs_to_active_hash :days_til_ship
end
