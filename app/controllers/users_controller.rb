class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

#display all users
def index
  @users = User.paginate(page:params[:page])
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
 @microposts = @user.microposts.paginate(page: params[:page])
 @feed_items = @user.feed.paginate(page: params[:page])

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

def destroy
  del_user = User.find(params[:id])
  del_user.destroy
  flash[:success] = "User removed"
  redirect_to users_url
end

private
def user_params
  params.require(user).permit(:name, :email, :password, :password_confirmation)
end


def correct_user
  @user = User.find(params[:id])
  redirect_to root_path unless current_user?(@user)
end

def admin_user
  redirect_to root_path unless current_user.admin?
end

end
