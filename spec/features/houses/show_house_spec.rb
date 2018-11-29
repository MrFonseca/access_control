RSpec.describe "show house details", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "205B") }

  before do
    visit root_url
    click_on "House index"
    click_on "Details"
  end

  it "shows house details" do
    expect(current_path).to eq(house_path(house))
    expect(page).to have_content("205B")
  end
end
