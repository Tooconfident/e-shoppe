class Product < ActiveRecord::Base
  validates :name, :description, :price, :quantity, presence: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
end
