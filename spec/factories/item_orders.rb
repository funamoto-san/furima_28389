FactoryBot.define do
  factory :item_order do
    token { "item_token" }
    postal_code { "478-0065" }
    shipping_region_id { 2 }
    city { '横浜市' }
    house_number { '青山1-1-1' }
    tel_number { '09012345678' }
  end
end