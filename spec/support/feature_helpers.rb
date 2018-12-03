module FeatureHelpers
  def admin_login
    visit root_url
    page.driver.browser.authorize(Figaro.env.username, Figaro.env.password)
    click_on "Login"
  end
end
