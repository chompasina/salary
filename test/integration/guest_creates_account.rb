require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  test 'user can create an account' do
    visit new_user_path
    fill_in "Username", with: "Tommasina"
    fill_in "Password", with: "password"
    click_button "Create Account"
    user = User.last

    assert_equal login_path, current_path
    assert page.has_content?("Please login")
  end
end
