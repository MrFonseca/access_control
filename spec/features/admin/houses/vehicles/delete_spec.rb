RSpec.describe "removing a vehicle from a house", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "125") }
  let!(:vehicle) { FactoryBot.create(:vehicle, plate: "QWE1234", house_id: house.id) }

  before do
    admin_login
    click_on "125"
    click_on "QWE1234"
  end

  it "ends the association between vehicle and house" do
    click_on "Remove from house 125"

    expect(current_path).to eq(admin_house_path(house))
    expect(page).to have_content("Vehicle removed from house 125")
    vehicle.reload
    expect(vehicle.house_id).to be_nil
  end
end
