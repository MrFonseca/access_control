module ApplicationHelper
  def display_house_number(person)
    return "Visitor" if person.house_id.nil?
    person.house.number
  end
end
