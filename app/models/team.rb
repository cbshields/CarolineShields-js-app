class Team < ApplicationRecord
  belongs_to :player
  belongs_to :sport
end
