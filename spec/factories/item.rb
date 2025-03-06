FactoryBot.define do
  factory :item do
    association :user
    name { 'test' }
    text { 'test' }
    category_id { 1 }
    sales_status_id { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id { 1 }
    scheduled_delivery_id { 1 }
    price { 3000 }

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('public/images/test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
