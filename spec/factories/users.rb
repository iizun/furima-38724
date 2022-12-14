FactoryBot.define do
  factory :user do
    user_name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'abcd01' }
    password_confirmation { password }
    last_name { '飯塚' }
    first_name { '寛' }
    last_name_ruby { 'カタカナ' }
    first_name_ruby { 'カタカナ' }
    birth_date { Faker::Date.in_date_period }
  end
end
