FactoryBot.define do
  factory :item do
    item_name { 'あ' * 40 }
    summary { 'あ' * 40 }
    category_id { '2' }
    condition_id { '2' }
    delivery_charge_id { '2' }
    prefecture_id { '2' }
    delivery_day_id { '2' }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
