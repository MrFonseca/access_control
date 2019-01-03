RSpec.describe "removing a resident from a house", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "1433") }
  let!(:resident) { FactoryBot.create(:person, :resident, name: "Peter Pan", house_id: house.id) }

  before do
    admin_login
    click_on "1433"
    click_on "Peter Pan"
  end

  it "ends the association of resident and house" do
    click_on "Move out"

    expect(current_path).to eq(admin_house_path(house))
    expect(page).to have_content("Peter Pan moved out from 1433")
    resident.reload
    expect(resident.house_id).to be_nil
  end
end
