RSpec.describe "show house details", type: :feature do
  let!(:house1) do
    FactoryBot.create(
      :house,
      number: "205B",
      address: "B apartament block",
      route: "2nd floor of the B block",
      status: "for sale"
    )
  end

  before do
    visit root_url
    click_on "House index"
    click_on "Details"
  end

  it "shows house details" do
    expect(current_path).to eq(house_path(house1))
    expect(page).to have_content("205B")
  end
end
