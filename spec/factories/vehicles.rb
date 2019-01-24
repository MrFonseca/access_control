FactoryBot.define do
  factory :vehicle do
    sequence :plate do |p|
      "#{p}"
    end
    brand "VW"
    model "Gol"
    color "Black"
    year 2018
  end
end
