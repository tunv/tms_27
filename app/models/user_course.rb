class UserCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  validates :user, uniqueness: {scope: :course_id}

  before_save :rebuild_user_subjects

  private
  def rebuild_user_subjects
    course.subjects.each do |subject|
      user.user_subjects.find_or_create_by subject: subject
      subject.tasks.each do |t|
        user.user_tasks.find_or_create_by task: t
      end
    end
  end
end
