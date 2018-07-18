class Position < ApplicationRecord
  #validates :name, presence: true
  belongs_to :player, optional: true
  belongs_to :sport, optional: true

end
