# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

image_array = [
"https://s-media-cache-ak0.pinimg.com/736x/94/ff/1d/94ff1d1c56924b0a69a40a7dad980ccb.jpg",
"http://egotvonline.com/wp-content/uploads/2011/01/weird-products-2.jpg",
"https://dumbtechgeek.files.wordpress.com/2010/05/att00240.jpg",
"http://www.businessblogshub.com/wp-content/uploads/2012/09/strange_product_1.jpg",
"http://www.vitamin-ha.com/wp-content/uploads/2012/11/Vh-funny_product_names_640_41.jpg",
"http://www.businessnewsdaily.com/images/i/000/002/065/original/raw-chicken.jpg?interpolation=lanczos-none&fit=inside%7C700:500",
"http://i2.wp.com/cdn.bgr.com/2013/08/banana-slicer.png?w=625",
"https://s-media-cache-ak0.pinimg.com/236x/f9/17/89/f91789e687c07f2a6750759d871dd8eb.jpg",
"http://epaper2.mid-day.com/images/no_image_thumb.gif"
]

require 'faker'

20.times do
  Product.create(name: Faker::Commerce.product_name, img: image_array.sample, description: Faker::Company.bs, price: Faker::Commerce.price.to_f, quantity: rand(10..20))
end


