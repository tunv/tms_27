class UserSubject < ActiveRecord::Base
  after_create:set_subject_activity
  
  belongs_to :user
  belongs_to :subject

  validates :user_id, presence: true
  validates :subject_id, presence: true

  private
  def set_subject_activity
    user.activities.find_or_create_by target_id: subject_id, content: Settings.activity.learn
  end
end
