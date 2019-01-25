class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :address
  has_many :positions
  has_many :sports, through: :positions
end
