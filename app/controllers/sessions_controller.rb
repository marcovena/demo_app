
class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		#	user = User.first

		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else 
			#erroreù
			flash.now[:error] = "Invalid credentials"
			render 'new'

		end

		

	end
	def destroy

	end

end
