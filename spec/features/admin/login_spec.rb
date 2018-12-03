RSpec.describe "admin login", type: :feature do
  before { visit root_url }

  context "with valid input" do
    before do
      page.driver.browser.authorize(
        Figaro.env.username,
        Figaro.env.password
      )
      click_on "Login"
    end

    it "logs user in" do
      expect(page).to have_content("New house")
    end
  end

  context "with invalid input" do
    before do
      page.driver.browser.authorize("INVALID", "INVALID")
      click_on "Login"
    end

    it "does not logs user in" do
      expect(page).to have_content("denied")
    end
  end
end
