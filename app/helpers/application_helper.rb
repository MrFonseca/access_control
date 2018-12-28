module ApplicationHelper
  def display_house_number(person)
    return " " if person.house_id.nil?
    person.house.number
  end
end
