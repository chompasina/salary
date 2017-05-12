require 'rails_helper'

describe "Slack client service" do
  xit 'makes a request' do
    visit '/slack/event'
    
    expect(page.status_code).to eq(200) 
  end  
end