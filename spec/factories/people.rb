FactoryBot.define do
  factory :person do
    name "John Smith"
    sequence :document do |d|
      "#{d}"
    end

    trait :resident do
      house
    end
  end
end
