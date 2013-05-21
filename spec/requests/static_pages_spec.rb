require 'spec_helper'

describe "StaticPages" do
  describe "home" do
    it "Should have the content 'sample APP'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      page.should have_content('sample APP')

	    end
	end


	describe "about" do
    it "Should have the content 'about page'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

 end

end
