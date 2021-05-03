FactoryBot.define do
  Faker::Config.locale = :ja

  factory :buyer_order do
    token { 'tk_test_abcdef0000000000000000000' }
    postal_code {Faker::Address.postcode}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {Gimei.address.kanji}
    address {Gimei.address.city.kanji}
    building {Faker::Address.street_address}
    phone_number {Faker::Number.number(11)}
  end
end