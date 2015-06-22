class Course < ActiveRecord::Base
  has_many :subjects, through: :course_subjects
  has_many :course_subjects, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.user.maximum}
  validates :description, presence: true
end
