FactoryBot.define do
  factory :item do
    product_name                  { 'あああ' }
    explanation                   { 'あああ' }
    category_id                   { 2 }
    condition_id                  { 2 }
    shipping_charge_id            { 2 }
    prefecture_id                 { 2 }
    packaging_day_id              { 2 }
    price                         { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
