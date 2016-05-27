class Category < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :category_products

  validates :name, presence: true
end
