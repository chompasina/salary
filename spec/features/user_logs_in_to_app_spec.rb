require 'rails_helper'

RSpec.feature "User can login" do
  scenario "they fill in their username and password" do
    user = User.create!(id: 20, username: "Tommas", password: "workshard", email: "tom@gmail.com", first_name: "Tommasina", last_name: "Miller")
    
    visit login_path
    
    fill_in 'session[username]', with: user.username
    fill_in 'session[password]', with: "workshard"
    
    click_on 'Click to log in'
    
    expect(current_path).to eq(user_path(user))
    within("#greeting") do
      expect(page).to have_content("Welcome, Tommas")
    end
  end
end

#sad path: waht happens if user doesn't exist, or has incrrect password?
