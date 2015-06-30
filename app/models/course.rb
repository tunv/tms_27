class Course < ActiveRecord::Base
  after_update :set_course_activity

  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :supervisors, ->{where(supervisor: Settings.user.supervisor)}, 
            class_name: "User", through: :user_courses, source: "user"
  has_many :trainees, ->{where(supervisor: Settings.user.notsupervisor)}, 
            class_name: "User", through: :user_courses, source: "user"
  has_many :subjects, through: :course_subjects
  has_many :course_subjects, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.user.maximum}
  validates :description, presence: true
  validates :status, presence: true, length: {maximum: Settings.user.maximum}

  scope :current_course, ->{where status: Settings.activity.start}

  private 
  def set_course_activity
    users.each {|user| user.activities.find_or_create_by target_id: id, content: Settings.activity.joined }
  end
end
