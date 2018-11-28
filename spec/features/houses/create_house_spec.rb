RSpec.describe "creating a new house", type: :feature do
  before do
    # TODO: change to text
    visit houses_path
    click_on "New house"
  end

  context "with valid input" do
    it "creates new house" do
      fill_in  "Number",  with: "101"
      fill_in  "Address", with: "Main street"
      fill_in  "Route",   with: "2nd left"
      fill_in  "Status",  with: "For sale"
      click_on "Submit"

      house = House.order(:created_at).last
      expect(current_path).to eq(house_path(house))
      expect(house).to have_attributes(
        number:  "101",
        address: "Main street",
        route:   "2nd left",
        status:  "For sale"
      )
    end
  end
end
