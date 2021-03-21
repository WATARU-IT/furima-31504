FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    family_name { '澁澤' }
    first_name { '榮一' }
    family_name_kana { 'シブサワ' }
    first_name_kana { 'エイイチ' }
    birth_day { '2000-01-01' }
    email { Faker::Internet.free_email }
    password { 'test123' }
    password_confirmation { password }
  end
end