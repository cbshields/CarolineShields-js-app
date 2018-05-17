class Sport < ApplicationRecord
  has_many :teams
  has_many :players, through :teams
end
