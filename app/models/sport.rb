class Sport < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :positions
  has_many :players, through: :positions

  
end
