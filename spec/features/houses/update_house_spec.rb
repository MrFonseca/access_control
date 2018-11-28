RSpec.describe "update house", type: :feature do
  let!(:house1) do
    FactoryBot.create(
      :house,
      number: "F 12",
      address: "F alley",
      route: "6th left",
      status: "sold"
    )
  end

  before do
    visit root_url
    click_on "House index"
    click_on "Edit"
  end

  it "populates form with existing data" do
    expect(find_field("Number").value).to eq("F 12")
    expect(find_field("Address").value).to eq("F alley")
    expect(find_field("Route").value).to eq("6th left")
    expect(find_field("Status").value).to eq("sold")
  end

  context "with valid input" do
    it "updates the house attributes" do
      fill_in  "Number",  with: "B 52"
      fill_in  "Address", with: "B street"
      fill_in  "Route",   with: "2nd right"
      fill_in  "Status",  with: "For rent"
      click_on "Submit"

      expect(current_path).to eq(house_path(house1))
      house1.reload
      expect(house1).to have_attributes(
        number:  "B 52",
        address: "B street",
        route:   "2nd right",
        status:  "For rent"
      )
    end
  end
end
