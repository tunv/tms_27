class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject

  before_save :rebuild_user_subjects

  private
  def rebuild_user_subjects
    course.trainees.each do |user|
      subject.user_subjects.find_or_create_by user: user
      subject.tasks.each do |t|
        user.user_tasks.find_or_create_by task: t
      end
    end
  end
end
