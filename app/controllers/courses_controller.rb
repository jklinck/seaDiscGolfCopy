class CoursesController < ApplicationController
  def index

    @courses = Course.order("name ASC").all

    if session[:user_id]
      @user = User.find(session[:user_id])
      @users = User.all
    end
  end

  def show
  	@course = Course.find(params[:id])

    if session[:user_id]
      @user = User.find(session[:user_id])
      @users = User.all
    end
  end

  def new
    if session[:user_id]
      @user = User.find(session[:user_id])
      @users = User.all
    else
      redirect_to "/"
    end
  end

  def create
  	@course = Course.create(course_params)
  	redirect_to "/courses/#{@course.id}"
  end

  def edit
    @course = Course.find(params[:id])

    if session[:user_id]
      @user = User.find(session[:user_id])
      @users = User.all
    else
      redirect_to "/"
    end
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    redirect_to "/courses/#{@course.id}"
  end

  def delete
    course = Course.find(params[:id])
    course.destroy
    redirect_to "/"
  end

  private
  	def course_params
  		params.require(:course).permit(:name,:street,:state,:city,:zip_code,:google_map)
  	end
end
