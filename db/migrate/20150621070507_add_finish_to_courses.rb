class AddFinishToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :finish, :date
  end
end
