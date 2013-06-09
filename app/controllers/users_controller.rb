class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

#display all users
def index
  @users = User.paginate(page: params[:page])
end

  def new
  	@user = User.new 
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome #{@user.name.upcase}"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

def update
  @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
    #successful update
    flash[:success] = "Profile Updated"
    sign_in(@user)
    redirect_to @user
  else
    render 'edit'
  end

end

  private
  	def user_params
  		params.require(user).permit(:name, :email, :password, :password_confirmation)
  	end

    def signed_in_user
      if !signed_in?
        store_location
      redirect_to signin_url, notice: "Please sign in"
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

end
