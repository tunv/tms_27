class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.datetime :start_at
      t.integer :finish

      t.timestamps null: false
    end
  end
end
