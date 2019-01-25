RSpec.describe "show vehicle details", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "111") }
  let!(:vehicle) { FactoryBot.create(:vehicle, plate: "QWE1114", house_id: house.id) }

  before do
    admin_login
    click_on "111"
    click_on "QWE1114"
  end

  it "opens vehicle page" do
    expect(current_path).to eq(admin_house_vehicle_path(house, vehicle))
    expect(page).to have_content("QWE1114")
  end
end
