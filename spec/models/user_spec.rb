# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do
	before do
		@user = User.new(name:"example user", email: "ex.email@email.com", password: "aioaioaio", password_confirmation: "aioaioaio")
	end
	subject {@user}

	it { should respond_to(:password_confirmation) }
	it { should respond_to(:remember_token) }
	it { should respond_to(:authenticate) }


	describe "remember_token" do
		before {@user.save}
		its(:remember_token) {should_not be_blank}
	end 
end
