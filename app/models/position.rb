class Position < ApplicationRecord
  validates :name, presence: true
  belongs_to :player#, optional: true
  belongs_to :sport#, optional: true


  # accepts_nested_attributes_for :sports, reject_if: :all_blank

  # def sports_attributes=(sports_attributes)
  #  sports_attributes.values.each do |sport_attributes|
  #
  #    binding.pry

  #  end
  # end
end
