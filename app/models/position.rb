class Position < ApplicationRecord
  validates :name, presence: true
  belongs_to :player#, optional: true
  belongs_to :sport#, optional: true


  accepts_nested_attributes_for :sport, reject_if: :all_blank

  
end
