FactoryBot.define do
  factory :item do
    name              {'test'}
    text              {'test'}
    price             {500}
    condition_id      {2}
    shipping_free_id  {2}
    shipping_area_id  {2}
    shipping_day_id   {2}
    category_id       {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end