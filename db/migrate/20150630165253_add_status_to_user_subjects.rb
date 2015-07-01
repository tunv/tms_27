class AddStatusToUserSubjects < ActiveRecord::Migration
  def change
    add_column :user_subjects, :status, :string, default: "Start"
  end
end
