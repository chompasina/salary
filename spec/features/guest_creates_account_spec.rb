require 'rails_helper'

RSpec.feature 'Guest can create account' do
  scenario 'new user can create an account' do
    visit new_user_path
    
    expect(page).to have_field("Username")
    expect(page).to have_field("Birthdate")
    expect(page).to have_field("Email Address")
    expect(page).to have_field("Password")
    expect(page).to have_field("First Name")
    expect(page).to have_field("Last Name")
    expect(page).to have_field("Turing Cohort")
    fill_in "Username", with: "Tommasina"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    fill_in "First Name", with: "Ollie"
    fill_in "Last Name", with: "Miller"
    fill_in "Email Address", with: "ollie@gmail.com"
    click_button "Create Account"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Please login")
  end
end
