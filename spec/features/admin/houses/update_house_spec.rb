RSpec.describe "update house", type: :feature do
  let!(:house) do
    FactoryBot.create(
      :house,
      number: "BB8",
      address: "Jakku",
      route: "6th galaxy",
      status: "empty"
    )
  end

  before do
    admin_login
    click_on "Edit"
  end

  context "with valid input" do
    it "updates the house attributes" do
      expect(find_field("Number").value).to eq("BB8")
      expect(find_field("Address").value).to eq("Jakku")
      expect(find_field("Route").value).to eq("6th galaxy")
      expect(find_field("Status").value).to eq("empty")
      fill_in  "Number",  with: "C3PO"
      fill_in  "Address", with: "Tatuin"
      fill_in  "Route",   with: "2nd planet"
      fill_in  "Status",  with: "Full"
      click_on "Submit"

      expect(current_path).to eq(admin_house_path(house))
      house.reload
      expect(house).to have_attributes(
        number:  "C3PO",
        address: "Tatuin",
        route:   "2nd planet",
        status:  "Full"
      )
    end
  end
end
