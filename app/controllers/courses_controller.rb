class CoursesController < ApplicationController
  before_action :logged_in_user
  
  def show
    @course = Course.find params[:id]
    @activities = current_user.activities.course_activities @course.id
    @subject = @course.subjects
  end
end
