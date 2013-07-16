require 'spec_helper'

feature 'Creating Cars' do
  scenario "can create a car" do
    visit '/'
    fill_in 'License Plate', with: "1234asd"
    fill_in 'State', with: "WA"
    fill_in 'Zip', with: "98122"
    fill_in 'Phone Number', with: "555-555-5555"
    choose 'I agree to these Terms & Conditions'
    click_button "Register"
    page.should have_content("Car has been added")
  end
end
