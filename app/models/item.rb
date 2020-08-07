class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length: {maximum: 40}
    validates :item_detail, length: {maximum: 1000}
    validates :item_category, numericality: { other_than: 1 }
    validates :item_condition, numericality: { other_than: 1 }
    validates :covered_shipping_by, numericality: { other_than: 1 }
    validates :ship_from_location, numericality: { other_than: 1 }
    validates :days_til_ship, numericality: { other_than: 1 }
    validates :price, length: { minimum: 300, maximum: 9999999}
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :item_category
    belongs_to_active_hash :item_condition
    belongs_to_active_hash :covered_shipping_by
    belongs_to_active_hash :ship_from_location
    belongs_to_active_hash :days_til_ship
end

