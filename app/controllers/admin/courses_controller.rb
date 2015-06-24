class Admin::CoursesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update]
  before_action :is_admin, except: [:index, :show]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = I18n.t "create_course_succ"
      redirect_to @course
    else
      render :new
    end
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    if @course.update_attributes course_params
      flash[:success] = I18n.t "Course updated"
      redirect_to @course
    else
      render :edit
    end
  end
  
  private
  def course_params
    params.require(:course).permit :name, :start, :description, :finish
  end
end
