RSpec.describe "deleting a house", type: :feature do
  let!(:house) { FactoryBot.create :house }

  before do
    visit root_url
    click_on "House index"
  end

  it "removes a existing house" do
    expect do
      click_on "Delete"
    end.to change(House, :count).by(-1)
    expect(current_path).to eq(houses_path)
    expect(House.find_by(id: house.id)).to be_nil
  end
end
