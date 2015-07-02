class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  validates :user_id, presence: true
  validates :task_id, presence: true

  after_create :set_task_activity

  private
  def set_task_activity
    user.activities.find_or_create_by target_id: task_id, content: Settings.activity.done
  end
end
