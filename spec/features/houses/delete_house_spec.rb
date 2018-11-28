RSpec.describe "deleting a house", type: :feature do
  let!(:house1) { FactoryBot.create :house }

  before do
    # TODO: change to text
    visit houses_path
  end

  it "removes a existing house" do
    expect do
      click_on "Delete"
    end.to change(House, :count).by(-1)
    expect(current_path).to eq(houses_path)
    expect(House.find_by(id: house1.id)).to be_nil
  end
end
