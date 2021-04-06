FactoryBot.define do
  factory :order_buyer do
    post_code { '123-4567' }
    city { Faker::Lorem.sentence }
    address { '港区六本木6-10-1' }
    phone_number { '09012345678' }
    prefecture_id { 2 }
    token { 'tok_abcdefghijk00000000000000000' }
    building_name { '六本木ヒルズ' }
    user_id { 1 }
    item_id { 1 }
  end
end