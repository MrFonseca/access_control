RSpec.describe "update vehicle", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "20") }
  let!(:vehicle) do
    FactoryBot.create(
      :vehicle,
      plate:    "PGO9876",
      brand:    "Volkswagen",
      model:    "Beetle",
      color:    "Blue",
      year:     1969,
      house_id: house.id
    )
  end

  before do
    admin_login
    click_on "20"
    click_on "PGO9876"
    click_on "Edit"
  end

  context "with valid input" do
    it "updates vehicle attributes" do
      expect(find_field("Plate").value).to eq("PGO9876")
      expect(find_field("Brand").value).to eq("Volkswagen")
      expect(find_field("Model").value).to eq("Beetle")
      expect(find_field("Color").value).to eq("Blue")
      expect(find_field("Year").value).to eq("1969")
      fill_in  "Plate", with: "BAT0001"
      fill_in  "Brand", with: "Wayne"
      fill_in  "Model", with: "Batmobile"
      fill_in  "Color", with: "Black"
      fill_in  "Year",  with: 1939
      click_on "Submit"

      expect(current_path).to eq(admin_house_vehicle_path(house, vehicle))
      expect(page).to have_content("Vehicle updated")
      vehicle.reload
      expect(vehicle).to have_attributes(
        plate:    "BAT0001",
        brand:    "Wayne",
        model:    "Batmobile",
        color:    "Black",
        year:     1939,
        house_id: house.id
      )
    end
  end
end
