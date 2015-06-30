class Supervisor < ActiveRecord::Base
  belongs_to :user  
  belongs_to :course

  validates :user, uniqueness: {scope: :course_id}
end
