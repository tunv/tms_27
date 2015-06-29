class Admin::UserCoursesController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show
    @course = Course.find params[:course_id]
  end
end
