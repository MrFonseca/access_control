RSpec.describe "adding existing person to house", type: :feature do
  let!(:house) { FactoryBot.create :house }
  let!(:person) { FactoryBot.create(:person, name: "Donald") }

  before do
    admin_login
    click_on house.number
    click_on "Add resident"
  end

  it "finds an exisiting person" do
    fill_in "Search", with: "Donald"
    click_on "Submit"

    expect(page).to have_content("Donald")
    click_on "Add"

    expect(current_path).to eq(admin_house_path(house))
    expect(page).to have_content("Resident added")
    expect(person.reload.house_id).to eq(house.id)
  end
end
