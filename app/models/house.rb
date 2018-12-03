class House < ApplicationRecord
  has_many :people
  has_many :vehicles
  has_many :pets
  has_many :visits, -> { where(contract_type: nil) }
  has_many :employees, -> { where.not(contract_type: nil) }, class_name: "Visit"

  validates :number, presence: true
  validates :number, uniqueness: { case_sensitive: false }
  validates :address, presence: true

  def self.vacant
    left_outer_joins(:people).where(people: { id: nil })
  end
end
