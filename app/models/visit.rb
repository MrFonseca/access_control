class Visit < ApplicationRecord
  belongs_to :house
  belongs_to :person
  belongs_to :vehicle
end
