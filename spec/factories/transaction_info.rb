FactoryBot.define do
  factory :transaction_info do
    postal_code        {"123-0123"}
    prefecture_id         {34}
    city               {"広島市"}
    address_line       {"ピろ島123MOmiji"}
    building_unit      {444}
    phone_number       {12345678901}
  end
end