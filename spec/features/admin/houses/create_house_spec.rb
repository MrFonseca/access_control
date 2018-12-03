RSpec.describe "creating a new house", type: :feature do
  before do
    admin_login
    click_on "New house"
  end

  context "with valid input" do
    it "creates new house" do
      fill_in  "Number",  with: "234"
      fill_in  "Address", with: "X street"
      fill_in  "Route",   with: "4th left"
      fill_in  "Status",  with: "Sold"
      click_on "Submit"

      house = House.order(:created_at).last
      expect(current_path).to eq(admin_house_path(house))
      expect(house).to have_attributes(
        number:  "234",
        address: "X street",
        route:   "4th left",
        status:  "Sold"
      )
    end
  end
end
