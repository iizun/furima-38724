FactoryBot.define do
  factory :order_ship do
    post_code { '114-0021' }
    prefecture_id { '2' }
    city { '岸町' }
    house_number { '1-1-1' }
    building_number {'test'}
    phone_number { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
