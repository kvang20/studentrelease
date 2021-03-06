require 'rails_helper'

feature 'Creating Families' do 
  before do
    visit '/' 

    click_link 'New Family'
  end

  scenario "can create a family" do
    fill_in 'Family Name', with: 'Hamilton'
    click_button 'Create Family'

    expect( page ).to have_content ( 'Family has been created!' )
    expect( page.current_url ).to eql( family_url( Family.where( name: "Hamilton" ).first ) )
    expect( page ).to have_title( "Hamilton - Family - Student Pickup" ) 
  end

  scenario "can not create a family without a name" do 
    click_button 'Create Family'

    expect( page ).to have_content( "Family has not been created!" ) 
  end
end
