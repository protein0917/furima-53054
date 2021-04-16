FactoryBot.define do
  factory :manegement_address do
    post_code         {'123-4567'}
    shipping_area_id  {2}
    city              {'あ'}
    house_number      {'1-1'}
    building_name     {'あ'}
    phone_number      {'12312341234'}
    manegement_id     {1}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end