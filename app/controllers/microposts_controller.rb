class MicropostsController < ApplicationController
  # GET /microposts
  # GET /microposts.json
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy


  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost successfully created"
      redirect_to root_url
    else
      flash[:error] = "Error creating micropost: #{@micropost.errors.full_messages}"
    #render 'static_pages/home'
    redirect_to root_url
  end
end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy
    redirect_to root_url

  end

  private
  def correct_user
    @micropost = current_user.microposts.find_by_id(params[:id])
    redirect_to root_url if @micropost.nil?

  end

end
