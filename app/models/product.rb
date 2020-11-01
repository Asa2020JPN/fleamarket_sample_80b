class Product < ApplicationRecord
  # belongs_to :saler, class_name: "User"
  # belongs_to :buyer, class_name: "User"
  belongs_to :category
  has_many :images
  has_one :brand
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :shippingcost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping

  validates :name, presence: true
  validates :images, presence: true
  validates :detail, presence: true
  validates :status_id, :prefecture_id, :shippingcost_id, :shipping_id, presence: true
  validates :price, presence: true
  # numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
