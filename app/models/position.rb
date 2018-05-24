class Position < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :player
  belongs_to :sport
end
