require_relative '../test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest

  test 'logged in user can logout' do
    user = User.create(username: "carmer", password: "password")

    visit login_path
    fill_in "Name", with: user.username
    fill_in "Password", with: "password"
    click_on "login"

    assert_equal user_path(user), current_path

    click_on("logout")

    assert_equal root_path, current_path

    refute page.has_content?("carmer")
  end
#use stub for anything that you need to be logged in for
end
