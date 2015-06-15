class Subject < ActiveRecord::Base
  belongs_to :user_subjects
  has_many :tasks, dependent: :destroy
  
  validates :name, presence: true, lenght: {maximum: Settings.user.max}
  validates :description, presence: true
end
