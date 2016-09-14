require 'rails_helper'

RSpec.feature "User can logout" do
  scenario "after logging in, user can logout" do
    user = User.create!(id: 20, username: "Tommas", password: "workshard", email: "tom@gmail.com", first_name: "Tommasina", last_name: "Miller")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "workshard"
    click_on "Click to log in"
    
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Tommas")
    
    click_on("Logout")
    
    expect(current_path).to eq (root_path)
    
    expect(page).to_not have_content("Tommas")
    
  end
end