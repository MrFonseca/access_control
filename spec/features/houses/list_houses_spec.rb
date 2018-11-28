RSpec.describe "list houses", type: :feature do
  let!(:house1) { FactoryBot.create(:house, address: "Osvaldo") }

  before { visit houses_path }

  it "lists all houses" do
    expect(page).to have_content("Osvaldo")
  end
end
