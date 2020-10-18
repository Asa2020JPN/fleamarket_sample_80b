class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postcode, :city, :block, :prefecture_id,  presence: true
end
