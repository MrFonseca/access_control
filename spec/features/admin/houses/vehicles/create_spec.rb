RSpec.describe "create new vehicle", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "94") }

  before do
    admin_login
    click_on "94"
    click_on "Add vehicle"
    click_on "New vehicle"
  end

  context "with valid input" do
    it "creates a new vehicle" do
      fill_in  "Plate", with: "AFF0808"
      fill_in  "Brand", with: "Porsche"
      fill_in  "Model", with: "Carrera"
      fill_in  "Color", with: "Grey"
      fill_in  "Year",  with: 2019
      click_on "Submit"

      vehicle = Vehicle.order(:created_at).last
      expect(current_path).to eq(admin_house_path(house))
      expect(page).to have_content("Vehicle created")
      expect(vehicle).to have_attributes(
        plate:    "AFF0808",
        brand:    "Porsche",
        model:    "Carrera",
        color:    "Grey",
        year:     2019,
        house_id: house.id
      )
    end
  end
end
