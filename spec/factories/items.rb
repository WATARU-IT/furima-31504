FactoryBot.define do
  factory :item do
    name { 'スーツ' }
    text { Faker::Lorem.sentence }
    category_id { 7 }
    status_id { 7 }
    prefecture_id { 7 }
    shipping_id { 7 }
    shipping_day_id { 7 }
    price { 777 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
