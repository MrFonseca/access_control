FactoryBot.define do
  factory :person do
    name "John Smith"
    sequence :document do |d|
      "#{d}"
    end
    house
  end
end
