class House < ApplicationRecord
  has_many :people
  has_many :vehicles
  has_many :pets
  has_many :visits

  def self.vacant
    left_outer_joins(:people).where(people: { id: nil })
  end
end
