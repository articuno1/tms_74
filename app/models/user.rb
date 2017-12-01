class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :activities, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy

  has_secure_password

  validates :username, presence: true, length:
    {maximum: Settings.users.maximum_username, minimum: Settings.users.minimum_username},
    format: {with: /\A[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*\z/},
    uniqueness: {case_sensitive: false}
  validates :fullname, presence: true, length:
    {maximum: Settings.users.maximum_username, minimum: Settings.users.minimum_username}
  validates :password_digest, presence: true, length: {maximum: Settings.users.maximum_password,
    minimum: Settings.users.minimum_password}

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end
end
