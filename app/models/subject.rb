class Subject < ActiveRecord::Base
  belongs_to :user_subjects
  has_many :tasks, dependent: :destroy, inverse_of: :subject
  has_many :courses, through: :course_subjects
  has_many :course_subjects, dependent: :destroy

  accepts_nested_attributes_for :tasks, allow_destroy: :true, reject_if: :all_blank
  accepts_nested_attributes_for :course_subjects
  
  validates :name, presence: true, length: {maximum: Settings.user.maximum}
  validates :description, presence: true

  after_update :check_finish
  
  private
  def check_finish
    if Settings.subject.finish == status
      tasks.update_all status: Settings.subject.finish
    end
  end
end
