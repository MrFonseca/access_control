RSpec.describe "show person details", type: :feature do
  let!(:person) { FactoryBot.create(:person, name: "McDuck") }

  before do
    admin_login
    click_on "People"
    click_on "Details"
  end

  it "shows person details" do
    expect(current_path).to eq(admin_person_path(person))
    expect(page).to have_content("McDuck")
  end
end
