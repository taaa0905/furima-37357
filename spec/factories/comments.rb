FactoryBot.define do
  factory :comment do
    content                   {'あ'}
    association :user
    association :item
  end
end
