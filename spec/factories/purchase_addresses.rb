FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '札幌市' }
    block { '中央区111' }
    building { '' }
    tel_number { 12_345_678 }
    token {"tok_abcdefghijk0000000000000000000"}
    association :user
    association :item
  end
end
