require 'spec_helper'

describe "StaticPages" do
  describe "home" do
    it "Should have the content Money" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/'
      page.should have_content('MoneyLove')

	    end
	end


	describe "about" do
    it "Should have the content 'about page'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/about'
      page.should have_content('About Us')
    end

 end

end
