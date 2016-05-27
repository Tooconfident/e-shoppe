class Product < ActiveRecord::Base
  has_many :orders
  has_many :carts, through: :orders
  has_many :category_products
  has_many :categories, through: :category_products
  validates :name, :description, :price, :quantity, presence: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
end
