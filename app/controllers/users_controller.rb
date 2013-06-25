class UsersController < ApplicationController

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
       redirect_to @user
    else
       flash[:error] = "User Account Not Created, Please Try Again!"
       redirect_to root_path
    end
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
        sign_in @user
        flash[:success] = "User Profile updated"
        redirect_to @user
    else
        render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted!"
    redirect_to users_path
  end

  def feed
    #this is preliminary
    Micropost.where("user_id = ?", id)
  end
end

