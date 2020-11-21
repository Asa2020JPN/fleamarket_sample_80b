class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postcode, :city, :block, :prefecture_id, :last_name, :first_name, :last_name_kana, :first_name_kana, presence: true
  validates :last_name, :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, :first_name_kana, format: { with:  /\A[ァ-ヶー－]+\z/}
  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :phone_number, format: {with: /\A\d{10,11}\z/}, allow_blank: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end