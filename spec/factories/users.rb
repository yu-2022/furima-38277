FactoryBot.define do
  factory :user do

    japanese_name = Gimei.name

    nickname{Faker::Name.first_name}
    email {Faker::Internet.free_email}
    password {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name {japanese_name.last}
    first_name{japanese_name.first}
    last_name_kana{japanese_name.last.katakana}
    first_name_kana{japanese_name.first.katakana}
    birthday{Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}

  end
end
