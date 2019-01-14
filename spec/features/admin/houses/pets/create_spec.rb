RSpec.describe "creating a new pet", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "114") }

  before do
    admin_login
    click_on "114"
    click_on "House pets"
    click_on "New pet"
  end

  context "with valid input" do
    it "creates a new pet" do
      fill_in  "Name",    with: "Scooby-Doo"
      fill_in  "Species", with: "Dog"
      fill_in  "Breed",   with: "Great Dane"
      fill_in  "Color",   with: "Brown"
      choose   "Male"
      choose   "Big"
      click_on "Submit"

      pet = Pet.order(:created_at).last
      expect(current_path).to eq(admin_house_pets_path(house))
      expect(page).to have_content("Pet created")
      expect(pet).to have_attributes(
        name:     "Scooby-Doo",
        species:  "Dog",
        breed:    "Great Dane",
        color:    "Brown",
        gender:   "Male",
        size:     "Big",
        house_id: house.id
      )
    end
  end
end
