class Product < ApplicationRecord
  has_many :products
  accepts_nested_attributes_for :image
end
