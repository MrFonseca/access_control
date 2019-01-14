RSpec.describe "deleting a pet", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "15") }
  let!(:pet) { FactoryBot.create(:pet, house_id: house.id) }

  before do
    admin_login
    click_on "15"
    click_on "House pets"
  end

  it "removes a existing pet" do
    expect do
      click_on "Delete"
    end.to change(Pet, :count).by(-1)
    expect(current_path).to eq(admin_house_pets_path(house))
    expect(page).to have_content("Pet deleted")
    expect(Pet.find_by(id: pet.id)).to be_nil
  end
end
