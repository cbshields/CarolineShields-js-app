class Player < ApplicationRecord
scope :under_18, lambda {where('age < ?',18)}
scope :over_18, lambda {where('age >= ?',18)}
  has_secure_password
  validates :name, uniqueness: true
  validates :name, :age, :address, :password, presence: true, on: :create
  has_many :positions
  has_many :sports, through: :positions

  accepts_nested_attributes_for :sports, reject_if: :all_blank
  accepts_nested_attributes_for :positions, reject_if: :all_blank

  def sports_attributes=(sport_attributes)
   sport_attributes.values.each do |sport_attribute|
     #better way to do this?
      if !sport_attribute[name].nil?
       sport = Sport.find_or_create_by(sport_attribute)
       self.sports << sport
     end
   end
 end


  def positions_attributes=(position_attributes)
   position_attributes.values.each do |position_attribute|
       if !position_attribute[name].nil?
       position = Position.find_or_create_by(position_attribute)
       self.positions << position
     end
   end
 end



end
