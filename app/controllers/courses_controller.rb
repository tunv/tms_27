class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = I18n.t "create_course_succ"
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def course_params
    params.require(:course).permit :name, :start, :description, :finish
  end
end
