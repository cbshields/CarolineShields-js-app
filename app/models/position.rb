class Position < ApplicationRecord
  validates :name, presence: true
  belongs_to :player
  belongs_to :sport

  def positions_attributes=(position_attributes)
   position_attributes.values.each do |position_attribute|
     #better way to do this?

     if !position_attribute[name].nil?

       position = Position.find_or_create_by(position_attribute)
       self.positions << position
     end
   end
  end

end
