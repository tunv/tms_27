class Admin::CoursesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update]
  before_action :is_admin, except: [:index, :show]
  before_action :set_course, only: [:edit, :update]

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
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = I18n.t "Admin.course_update"
      redirect_to [:admin, @course]
    else
      render :edit
    end
  end

  private
  def course_params
    params.require(:course).permit :name, :start, :description, :finish, :status, subject_ids: []
  end

  def set_course
    @course = Course.find params[:id]
  end
end
