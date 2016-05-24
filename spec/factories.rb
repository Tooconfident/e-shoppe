FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    img { "http://epaper2.mid-day.com/images/no_image_thumb.gif"}
    description {Faker::Company.bs}
    price {Faker::Commerce.price.to_f}
  end
end
