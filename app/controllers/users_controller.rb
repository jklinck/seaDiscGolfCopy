class UsersController < ApplicationController

  before_action :require_correct_user, only: [:show, :edit, :update, :delete]

  def index

      # this is a copy of the original project with the admin user_type replaced with "admin" 
      if session[:user_id] && session[:user_type] == "admin"
        @user = User.find(session[:user_id])
        @users = User.order("id ASC").all
      else
        redirect_to "/"
      end
  end

  def new
    @user = User.new
    if session[:user_id]
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])

    if session[:user_id] && session[:user_type] == "admin"
      @loggedinUser = User.find(session[:user_id])
      @user = User.find(params[:id])
    elsif session[:user_id] && session[:user_type] != "admin"
      @loggedinUser = User.find(session[:user_id])
      @user = User.find(params[:id])
    else
      redirect_to "/"
    end

  end

  # shows user login page
  def login
    @user = User.new
    if session[:user_id]
      redirect_to "/"
    end
  end

  # logs in a user or displays error messages
  def userLogin
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:user_type] = @user.user_type
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice]= "Invalid username/password combination"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "New User Created"
  	  redirect_to "/users/#{@user.id}"
    else
      render "new"
    end
  end

  def edit
    unless session[:user_id]
      redirect_to "/"
    end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to "/users/#{@user.id}"
    else
      render "edit"
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.first_name = params[:first_name]
    @user.destroy
    if session[:user_type] != "admin"
      session[:user_id] = nil
    end
    redirect_to "/"
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:user_type,:password,:password_confirmation)
    end
end
