class TransactionInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building_unit, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address_line
    validates :phone_number, format: {with: /\A[0-9]{,11}\z/}
  end

  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building_unit: building_unit, phone_number: phone_number, user_id: user_id, item_id: item_id)
    Purchase.create(item_id: item_id, user_id: user_id)
  end
end

  