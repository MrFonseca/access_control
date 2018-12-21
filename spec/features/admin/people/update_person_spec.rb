RSpec.describe "update person", type: :feature do
  let!(:person) do
    FactoryBot.create(
      :person,
      name: "Jack",
      document: "2x2",
      phone: "rp2ai2",
      access: true
    )
  end

  before do
    admin_login
    click_on "People"
    click_on "Edit"
  end

  context "with valid input" do
    it "updates the person attributes" do
      expect(find_field("Name").value).to eq("Jack")
      expect(find_field("Document").value).to eq("2x2")
      expect(find_field("Phone").value).to eq("rp2ai2")
      expect(page).to have_checked_field("person_access_true")
      fill_in  "Name",       with: "Marty McFly"
      fill_in  "Document",   with: "past1955"
      fill_in  "Phone",      with: "20151985"
      choose   "Access allowed"
      click_on "Submit"

      expect(current_path).to eq(admin_person_path(person))
      person.reload
      expect(person).to have_attributes(
        name:     "Marty McFly",
        document: "past1955",
        phone:    "20151985",
        access:   true
      )
    end
  end
end
