FactoryBot.define do
  factory :house do
    sequence :number do |n|
      "#{n} A"
    end
    address "A street"
    route "go ahead"
    status "sold"
  end
end
