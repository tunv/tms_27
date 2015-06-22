class RemoveStartAtFromUserCourses < ActiveRecord::Migration
  def change
    remove_column :user_courses, :start_at, :datetime
  end
end
