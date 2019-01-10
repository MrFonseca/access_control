module ApplicationHelper
  def display_house_number(person)
    return " " if person.house_id.nil?
    person.house.number
  end

  def disable(person)
    return "disabled" if person.house_id.present?
  end
end
