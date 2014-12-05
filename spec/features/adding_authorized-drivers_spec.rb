require 'rails_helper'

feature 'Adding Authorized Drivers' do 
  before do
    visit '/' 

    click_link 'Add Authorized Drivers'
  end

  scenario "can add a driver" do
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Date from', with: '1/1/2015'
    fill_in 'Date to', with: '1/2/2015'
    click_button 'Add Driver'

    expect( page ).to have_content ( 'Driver has been added!' )
  end

  scenario "cannot add a driver" do 
    click_button 'Add Driver'

    expect( page ).to have_content( "Driver has not been added!" ) 
  end
end
