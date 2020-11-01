class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product

  validates :image, :product, presence: true
  validates_presence_of :product
end