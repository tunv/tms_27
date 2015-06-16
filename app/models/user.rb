class User < ActiveRecord::Base
  has_secure_password

  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.user.max}
  validates :email, presence: true, format: {with: Settings.user.valid_mail}, uniqueness:{case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.min}
  validates :password_confirmation, presence: true
end
