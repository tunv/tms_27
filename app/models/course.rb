class Course < ActiveRecord::Base
  has_many :subjects, through: :course_subjects
  has_many :course_subjects, dependent: :destroy
  belongs_to :supervisor, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.user.max}
  validates :description, presence: true
end
