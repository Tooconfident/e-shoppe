# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

20.times do
  Product.create(name: Faker::Commerce.product_name, img: "http://epaper2.mid-day.com/images/no_image_thumb.gif", description: Faker::Company.bs, price: Faker::Commerce.price.to_f)
end


