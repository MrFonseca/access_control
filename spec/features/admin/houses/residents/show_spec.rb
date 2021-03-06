RSpec.describe "show resident details", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "1521") }
  let!(:resident) { FactoryBot.create(:person, :resident, name: "McDuck", house_id: house.id) }

  before do
    admin_login
    click_on "1521"
    click_on "McDuck"
  end

  it "opens resident page" do
    expect(current_path).to eq(admin_house_resident_path(house, resident))
    expect(page).to have_content("McDuck")
  end
end
