class Player < ApplicationRecord
  has_secure_password
  has_many :teams
  has_many :sports, :through teams
end
