class Sport < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :positions
  has_many :players, through: :positions

 #  def positions_attributes=(position_attributes)
 #    binding.pry
 #   position_attributes.values.each do |position_attribute|
 #
 #       if !position_attribute[:name].empty?
 #         binding.pry
 #       position = Position.find_or_create_by(position_attribute)
 #       self.positions << position
 #     end
 #   end
 # end
end
