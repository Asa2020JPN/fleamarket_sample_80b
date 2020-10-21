class Product < ApplicationRecord
  # belongs_to :saler, class_name: "User"
  # belongs_to :buyer, class_name: "User"
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping
end
