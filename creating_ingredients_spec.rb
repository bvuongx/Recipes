require 'spec_helper'

feature "Creating Ingredients" do
  before do
    Factory(:recipe, :name => "Internet Explorer")
    visit '/'
    click_link "Internet Explorer"
    click_link "New Ingredient"
  end

  scenario "Creating a recipe" do
    fill_in "Title", :with => "Non-standards compliance"
    click_button "Create Ingredients"
    page.should have_content("Ticket has been created.")
  end

  scenario "Creating an ingredient without valid attributes fails" do
    click_button "Create Ingredient"
    page.should have_content("Ingredient has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
  end
end
