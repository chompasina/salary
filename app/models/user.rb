class User < ActiveRecord::Base
  has_secure_password
  has_many :user_jobs
  has_many :jobs, through: :user_jobs

  # validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  # validates :email, presence: true, uniqueness: true, email: { strict_mode: true }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
