FactoryBot.define do
  factory :item do
    item_name                       {"テスト用のアイテム名"}
    item_detail                     {Faker::Lorem.sentence}
    item_category_id                {Faker::Number.between(from: 1, to: 10)}
    item_condition_id               {Faker::Number.between(from: 1, to: 6)}
    covered_shipping_by_id          {Faker::Number.between(from: 1, to: 2)}
    ship_from_location_id           {Faker::Number.between(from: 1, to: 47)}
    days_til_ship_id                {Faker::Number.between(from: 1, to: 3)}
    price                           {Faker::Number.between(from: 300, to: 1000000)}
    user
  end
end

