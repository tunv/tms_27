class Task < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  
  validates :name, presence: true, length: {maximum: Settings.user.maximum}
  validates :description, presence: true
end
