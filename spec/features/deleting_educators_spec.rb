require 'rails_helper'

feature "Deleting Educators" do
  scenario "Deleting A Educator" do
    FactoryGirl.create( :educator, name: "Lisa" ) 

    visit "/"
    click_link "Lisa"
    click_link "Delete Educator"

    visit "/"

    expect( page ).to have_no_content( "Lisa" )
  end
end
