RSpec.describe "list houses", type: :feature do
  let!(:house) { FactoryBot.create(:house, address: "Artemia") }

  before do
    admin_login
  end

  it "lists all houses" do
    expect(page).to have_content("Artemia")
  end
end
