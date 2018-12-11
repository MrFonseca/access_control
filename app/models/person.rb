class Person < ApplicationRecord
  belongs_to :house, optional: true
  has_many :visits

  validates :name, presence: true
  validates :document, uniqueness: { case_sensitive: false }, presence: true
end
