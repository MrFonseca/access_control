RSpec.describe "list people", type: :feature do
  let!(:person) { FactoryBot.create(:person, name: "Donald") }

  before do
    admin_login
    click_on "People"
  end

  it "list all people" do
    expect(page).to have_content("Donald")
  end
end
