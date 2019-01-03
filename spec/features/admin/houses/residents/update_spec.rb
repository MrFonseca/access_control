RSpec.describe "update resident", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "957") }
  let!(:resident) do
    FactoryBot.create(
      :person,
      :resident,
      name: "Jack",
      document: "282804",
      phone: "03012019",
      house_id: house.id
    )
  end

  before do
    admin_login
    click_on "957"
    click_on "Jack"
    click_on "Edit"
  end

  context "with valid input" do
    it "updates the resident attributes" do
      expect(find_field("Name").value).to eq("Jack")
      expect(find_field("Document").value).to eq("282804")
      expect(find_field("Phone").value).to eq("03012019")
      fill_in  "Name",       with: "Marty McFly"
      fill_in  "Document",   with: "past1955"
      fill_in  "Phone",      with: "20151985"
      click_on "Submit"

      expect(current_path).to eq(admin_house_resident_path(house, resident))
      expect(page).to have_content("Resident updated")
      resident.reload
      expect(resident).to have_attributes(
        name:     "Marty McFly",
        document: "past1955",
        phone:    "20151985"
      )
    end
  end
end
