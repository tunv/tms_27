class AddStatusToCourseSubjects < ActiveRecord::Migration
  def change
    add_column :course_subjects, :status, :string
  end
end
