require 'spec_helper'

describe "Authentication" do
	subject{page}
	describe "signin page" do
		before {visit signin_path}
		describe 'with invalid information' do
			it { should have_selector('title', text: 'Sign In') }
			it { should have_selector('div.alert alert-error', text: 'Invalid') }
		end

		describe 'with valid information' do
			let(:user) {FactoryGirl.create(:user)}		
			before do
				fill_in "Email", with: user.name.upcase
				fill_in "Password", with: user.password
				click_button "Sign In"
			end

			it { should have_selector('title', text: user.name) }
			it { should have_link('Profile', href: user_path(user)) }
			it { should have_link('Sign Out', href: signout_path) }

			it { should_not have_link('Sign In', href: signin_path) }
		end

		describe "after visiting another page" do
			before { click_link "Home" }
			it { should_not have_selector('div.alert.alert-error') }
		end
	end



end
