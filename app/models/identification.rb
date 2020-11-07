class Identification < ApplicationRecord
  belongs_to :user, optional: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
  validates :last_name, :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, :first_name_kana, format: { with:  /\A[ァ-ヶー－]+\z/}
end
