class Visit < ApplicationRecord
  belongs_to :house, optional: true
  belongs_to :person, optional: true
  belongs_to :vehicle, optional: true
end
