FactoryBot.define do
  factory :item do
    name { 'スーツ' }
    text { Faker::Lorem.sentence }
    category_id { 1 }
    status_id { 1 }
    prefecture_id { 1 }
    shipping_id { 1 }
    shipping_day_id {  }
    price { 123 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
