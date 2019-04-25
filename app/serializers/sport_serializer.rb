class SportSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :positions
  has_many :players, through: :positions
end
