FactoryBot.define do
  factory :item do
    # image              {}
    name                 {Faker::Name.name}
    explanation          {Faker::Lorem.sentence}
    category_id          {2}
    state_id             {2}
    delivery_charge_id   {2}
    shipping_region_id   {2}
    shipping_day_id      {2}
    price                {1000}

    association :user
  end
end



