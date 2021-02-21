FactoryBot.define do
  factory :item do
    name                    { Faker::Commerce.product_name }
    introduction            { Faker::Lorem.sentence }
    category_id             { Faker::Number.between(from: 2, to: 11) }
    item_status_id          { Faker::Number.between(from: 2, to: 7) }
    postage_payer_id        { Faker::Number.between(from: 2, to: 3) }
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    preparation_day_id      { Faker::Number.between(from: 2, to: 4) }
    price                   { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
