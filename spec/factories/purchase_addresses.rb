FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '札幌市' }
    block { '中央区111' }
    building { '札幌ビル2階' }
    tel_number { 1203450678 }
    token {"tok_abcdefghijk0000000000000000000"}
  end
end
