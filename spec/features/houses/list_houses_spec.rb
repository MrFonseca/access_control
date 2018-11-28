RSpec.describe "list houses", type: :feature do
  let!(:house1) { FactoryBot.create(:house, address: "Osvaldo") }

  before do
    visit root_url
    click_on "House index"
  end

  it "lists all houses" do
    expect(page).to have_content("Osvaldo")
  end
end
