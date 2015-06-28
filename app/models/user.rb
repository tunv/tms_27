class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_secure_password

  has_many :activities, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses, dependent: :destroy
  has_many :subjects, through: :user_subjects, dependent: :destroy
  has_many :user_subjects, dependent: :destroy

  FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: Settings.user.maximum}
  validates :email, presence: true, format: {with: FORMAT}, uniqueness:{case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.minimum}
  validates :password_confirmation, presence: true
  
  scope :trainee, ->{where.not supervisor: Settings.user.supervisor}

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 
    BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def training object
    if object.instance_of? Subject
      user_subjects.create subject_id: object.id, status: Settings.activity.training
    end
  end

  def finished? object
    if object.instance_of? Subject
      user_subjects.exists? subject_id: object.id, status: Settings.finished
    end
  end

  def training? object
    if object.instance_of? Subject
      user_subjects.exists? subject_id: object.id, status: Settings.training
    end
  end
end
