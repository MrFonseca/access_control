class Pet < ApplicationRecord
  belongs_to :house, optional: true
end
