class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  validates :nickname ,presence: true
  validates :email, format: { with:  /\A\S+@\S+\.\S+\z/}
  has_one :identification
  has_one :address
end 

