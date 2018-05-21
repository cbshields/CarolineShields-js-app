class Player < ApplicationRecord
  has_secure_password
  has_many :positions
  has_many :sports, :through :positions
end
