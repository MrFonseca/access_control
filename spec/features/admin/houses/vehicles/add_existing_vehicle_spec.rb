RSpec.describe "adding existing vehicle to house", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "44") }
  let!(:vehicle) { FactoryBot.create(:vehicle, plate: "PKM1546", house_id: nil) }

  before do
    admin_login
    click_on "44"
    click_on "Add vehicle"
  end

  it "finds an existing vehicle" do
    fill_in "Search", with: "PKM1546"
    click_on "Submit"

    expect(page).to have_content("PKM1546")
    click_on "Add"

    expect(current_path).to eq(admin_house_path(house))
    expect(page).to have_content("Vehicle added")
    expect(vehicle.reload.house_id).to eq(house.id)
  end
end
