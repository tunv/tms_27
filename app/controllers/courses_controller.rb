class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @course = Course.new
  end

  private
  def course_params
    params.require(:course).permit :name, :start, :description, :finish
  end
end
