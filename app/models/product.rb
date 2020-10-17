class Product < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :days_to_ship
end
