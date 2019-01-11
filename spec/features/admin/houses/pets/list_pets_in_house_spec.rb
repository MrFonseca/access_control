RSpec.describe "lists all pets in the house", type: :feature do
  let!(:house) { FactoryBot.create(:house, number: "153") }
  let!(:pet) { FactoryBot.create(:pet, name: "Pikachu", house_id: house.id) }

  before do
    admin_login
    click_on "153"
    click_on "Add pet"
  end

  it "lists all pets attributes in the house" do
    expect(page).to have_content("Pikachu")
  end
end
