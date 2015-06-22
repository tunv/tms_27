class AddStartToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :start, :date
  end
end
