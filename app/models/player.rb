class Player < ApplicationRecord
scope :under_18, lambda {where('age < ?',18)}
scope :over_18, lambda {where('age >= ?',18)}
  has_secure_password
  validates :name, :age, :address, :password, presence: true, on: :create
  has_many :positions
  has_many :sports, through: :positions

  accepts_nested_attributes_for :positions, reject_if: :all_blank

   def positions_attributes=(positions_attributes)
    positions_attributes.values.each do |position_attributes|
       if !position_attributes[:name].empty? && position_attributes[:sport_id].empty?
        position = Position.find_or_create_by(name: position_attributes[:name])
        new_sport = Sport.new(name: position_attributes[:sport][:name])
        if new_sport.save
          position.sport = new_sport
          self.positions << position
         end
       elsif !position_attributes[:name].empty?
         position = Position.find_or_create_by(name: position_attributes[:name], sport_id: position_attributes[:sport_id])
         self.positions << position
      end
    end
  end

end
