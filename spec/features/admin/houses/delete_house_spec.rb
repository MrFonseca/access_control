RSpec.describe "deleting a house", type: :feature do
  let!(:house) { FactoryBot.create :house }

  before do
    admin_login
  end

  it "removes a existing house" do
    expect do
      click_on "Delete"
    end.to change(House, :count).by(-1)
    expect(current_path).to eq(admin_houses_path)
    expect(House.find_by(id: house.id)).to be_nil
  end
end
