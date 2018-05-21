class Sport < ApplicationRecord
  has_many :positions
  has_many :players, through :positions
end
