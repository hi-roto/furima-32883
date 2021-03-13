FactoryBot.define do
  factory :purchase_record_shipping_address do
    postal_code { '123-1234' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Gimei.city.kanji }
    house_number { Gimei.town.kanji + '1-1-1' }
    phone_number { Faker::Number.number(digits: 10) }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { Faker::Number.digit}
    item_id { Faker::Number.digit}
  end
end
