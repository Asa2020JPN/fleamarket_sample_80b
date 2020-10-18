class Identification < ApplicationRecord
  belongs_to :user, optional: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
end
