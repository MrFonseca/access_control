RSpec.describe "deleting a person", type: :feature do
  let!(:person) { FactoryBot.create :person }

  before do
    admin_login
    click_on "People"
  end

  it "removes a existing person" do
    expect do
      click_on "Delete"
    end.to change(Person, :count).by(-1)
    expect(current_path).to eq(admin_people_path)
    expect(Person.find_by(id: person.id)).to be_nil
  end
end
