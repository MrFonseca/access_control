RSpec.describe "creating a new person", type: :feature do
  let!(:house) { FactoryBot.create :house }

  before do
    admin_login
    click_on "People"
    click_on "New person"
  end

  context "with valid input" do
    it "creates a new person" do
      fill_in  "Name",       with: "Marty McFly"
      fill_in  "Document",   with: "past1955"
      fill_in  "Phone",      with: "20151985"
      choose   "Access allowed"
      select   house.number, from: "House"
      click_on "Submit"

      person = Person.order(:created_at).last
      expect(current_path).to eq(admin_person_path(person))
      expect(person).to have_attributes(
        name:     "Marty McFly",
        document: "past1955",
        phone:    "20151985",
        access:   true,
        house_id: house.id
      )
    end
  end
end
