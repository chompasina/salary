class User < ActiveRecord::Base
  has_secure_password
  has_many :jobs

  enum role: ["default", "admin"]
end
