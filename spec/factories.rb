FactoryGirl.define do
  factory :category_product do
    category nil
    product nil
  end
  factory :category do
    type ""
  end
  factory :user do
    username "MyString"
    email "MyString"
    password_digest "MyString"
    is_admin false
  end
  factory :product do
    name { Faker::Commerce.product_name }
    img { "http://epaper2.mid-day.com/images/no_image_thumb.gif"}
    description {Faker::Company.bs}
    price {Faker::Commerce.price.to_f}
    quantity {rand(10..20)}
  end
end
