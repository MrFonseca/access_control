RSpec.describe "show house details", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "R2D2") }

  before do
    admin_login
    click_on "Details"
  end

  it "shows house details" do
    expect(current_path).to eq(admin_house_path(house))
    expect(page).to have_content("R2D2")
  end
end
