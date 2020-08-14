FactoryBot.define do
  factory :item do
    item_name                       {"テスト用のアイテム名"}
    item_detail                     {"テスト用のアイテム詳細"}
    item_category_id                {1}
    item_condition_id               {2}
    covered_shipping_by_id          {2}
    prefecture_id                   {15}
    days_til_ship_id                {3}
    price                           {5000}
    user
  end
end

