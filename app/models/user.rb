class User < ActiveRecord::Base
  has_secure_password

  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy

  FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: Settings.user.maximum}
  validates :email, presence: true, format: {with: FORMAT}, uniqueness:{case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.minimum}
  validates :password_confirmation, presence: true
end
