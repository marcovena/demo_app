require 'spec_helper'

describe "User pages" do
  subject {page}


  describe "Profile page" do 
  	let(:user) {FactoryGirl.create(:user)}
  	before {visit user_path(user)}

  	it { should have_content(user.name)}
  	it { should have_title(user.name)}
  end

  describe "signup page" do 
  	before {visit signup_path}

    let(:submit) { "Create my account"}

    describe "with invalid information" do 
      it "should not create a user" do 
        expect {click_button "Create my account"}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",     with:"MyExampleUser"
        fill_in "email",      with:"MyExampleUser@domain.com"
        fill_in "Password",     with:"MyExampleUser"
        fill_in "Confirmation",     with:"MyExampleUser"
      end
      it "should create a user" do
        expect {click_button "Create my account"}.to change(User, :count).by(1)
      end
    end
  end
end 
