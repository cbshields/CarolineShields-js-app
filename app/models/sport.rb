class Sport < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :positions
  has_many :players, through: :positions

  def sports_attributes=(sport_attributes)
   sport_attributes.values.each do |sport_attribute|
     #better way to do this?

     if !sport_attribute[name].nil?

       sport = Sport.find_or_create_by(sport_attribute)
       self.sports << sport
     end
   end
 end
end
