class Activity < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :target_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.user.maximum}

  scope :course_activities, ->course_id{where target_id: course_id, content: Settings.activity.joined}
end
