class Player < ApplicationRecord
scope :under_18, lambda {where('age < ?',18)}
scope :over_18, lambda {where('age >= ?',18)}
  has_secure_password
  validates :name, uniqueness: true
  validates :name, :age, :address, :password, presence: true, on: :create
  has_many :positions
  has_many :sports, through: :positions

  #accepts_nested_attributes_for :sports
end
