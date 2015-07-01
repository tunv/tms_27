class AddStatusToUserTasks < ActiveRecord::Migration
  def change
    add_column :user_tasks, :status, :string, default: Settings.activity.start
  end
end
