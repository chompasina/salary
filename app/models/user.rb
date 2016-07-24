class User < ActiveRecord::Base
  has_secure_password
  has_many :user_jobs
  has_many :jobs, through: :user_jobs

  # enum role: ["default", "admin"]
end
