class Player < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: true
  validates :name, :age, :address, :password, presence: true
  has_many :positions
  has_many :sports, through: :positions
end
