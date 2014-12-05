require 'rails_helper'

feature "Creating Educators" do
  before do
		visit '/'
		
		click_link "Add New Educator"
	end

  scenario "can create a educator" do
		fill_in "First Name", with: "Lisa"
		fill_in "Last Name", with: "Barnes"
    fill_in "Grade", with: "5"
    click_button "Create Educator"

		expect( page ).to have_content( "Educator created!" )
	end

	scenario "Creating a educator without valid attributes fails" do
		click_button "Create Educator"

		expect( page ).to have_content( "Educator not added." ) 
		expect( page ).to have_content( "First Name can't be blank." )
		expect( page ).to have_content( "Last Name can't be blank." )
		expect( page ).to have_content( "Grade can't be blank." )
	end
end 
