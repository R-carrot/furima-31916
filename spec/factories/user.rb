FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    encrypted_password {password}
    first_name {Gimei.name.first.kanji}
    last_name {Gimei.name.last.kanji}
    first_name_katakana {Gimei.name.first.katakana}
    last_name_katakana {Gimei.name.last.katakana}
    birth_day {Faker::Date.between(from:'1930-01-01', to:'2016-12-31')}
  end


end