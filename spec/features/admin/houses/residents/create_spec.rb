RSpec.describe "creating a new resident", type: :feature do
  let!(:house) { FactoryBot.create :house }

  before do
    admin_login
    click_on house.number
    click_on "Add resident"
    click_on "New resident"
  end

  context "with valid input" do
    it "creates a new resident" do
      fill_in  "Name",       with: "Marty McFly"
      fill_in  "Document",   with: "past1955"
      fill_in  "Phone",      with: "20151985"
      click_on "Submit"

      person = Person.order(:created_at).last
      expect(current_path).to eq(admin_house_path(house))
      expect(page).to have_content("Resident created")
      expect(person).to have_attributes(
        name:     "Marty McFly",
        document: "past1955",
        phone:    "20151985",
        house_id: house.id
      )
    end
  end
end
