FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"test123"}
    password_confirmation {"test123"}
    last_name             {"山むラ"}
    first_name            {"はナ子"}
    last_name_reading     {"ヤマムラ"}
    first_name_reading    {"ハナコ"}
    birthday              {"1990-10-10"}
  end
end


