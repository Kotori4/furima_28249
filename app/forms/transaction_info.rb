class TransactionInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building_unit, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address_line
    validates :phone_number
  end

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture_id


  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building_unit: building_unit, phone_number: phone_number, user_id: user_id, item_id: item_id)
    Purchase.create(item_id: item_id, user_id: user_id)
    binding.pry
  end
end

# , format:{with: /^[0-9]+$/, message: "is invalid. Input half-width characters and not include hyphen."}
# , numericality :only_integer

# , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
# , format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}