RSpec.describe "update pet", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "20") }
  let!(:pet) do
    FactoryBot.create(
      :pet,
      name: "Tom",
      species: "Cat",
      breed: "Mixed",
      color: "Grey",
      gender: "Male",
      size: "Medium",
      house_id: house.id
    )
  end

  before do
    admin_login
    click_on "20"
    click_on "House pets"
    click_on "Edit"
  end

  context "with valid input" do
    it "updates the pet attributes" do
      expect(find_field("Name").value).to eq("Tom")
      expect(find_field("Species").value).to eq("Cat")
      expect(find_field("Breed").value).to eq("Mixed")
      expect(find_field("Color").value).to eq("Grey")
      expect(find_field("Male")).to be_checked
      expect(find_field("Medium")).to be_checked
      fill_in  "Name",    with: "Jerry"
      fill_in  "Species", with: "Rat"
      fill_in  "Breed",   with: "Unknown"
      fill_in  "Color",   with: "Brown"
      choose   "Male"
      choose   "Small"
      click_on "Submit"

      expect(current_path).to eq(admin_house_pets_path(house))
      expect(page).to have_content("Pet updated")
      pet.reload
      expect(pet).to have_attributes(
        name:     "Jerry",
        species:  "Rat",
        breed:    "Unknown",
        color:    "Brown",
        gender:   "Male",
        size:     "Small",
        house_id: house.id
      )
    end
  end
end
