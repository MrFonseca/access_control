class Vehicle < ApplicationRecord
  belongs_to :house, optional: true
  has_many :visits
end
