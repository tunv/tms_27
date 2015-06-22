class RemoveFinishFromUserCourses < ActiveRecord::Migration
  def change
    remove_column :user_courses, :finish, :integer
  end
end
