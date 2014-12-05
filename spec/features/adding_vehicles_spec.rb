require 'rails_helper'

feature 'Adding Vehicles' do 
  before do
    visit '/' 

    click_link 'Add New Vehicle'
  end

  scenario "can add a vehicle" do
    fill_in 'Year', with: '2009'
    fill_in 'Make', with: 'Honda'
    fill_in 'Model', with: 'Civic'
    fill_in 'Color', with: 'Black'
    fill_in 'Plate #', with: '1234567'
    fill_in 'Plate State', with: 'NC'
    click_button 'Add Vehicle'

    expect( page ).to have_content ( 'Vehicle has been added!' )
  end

  scenario "cannot add a vehicle" do 
    click_button 'Add Vehicle'

    expect( page ).to have_content( "Vehicle has not been added!" ) 
  end
end
