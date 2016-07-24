require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest

  test 'user can log in successfully' do
    user = User.create(username: "carmer", password: "password")

    visit login_path

    fill_in 'session[username]', with: user.username
    fill_in 'session[password]', with: "password"

    click_on 'Click to log in'

    assert_equal user_path(user), current_path

    within("#greeting") do
      assert page.has_content?("Welcome, carmer!")
    end
  end
end

#sad path: waht happens if user doesn't exist, or has incrrect password?
