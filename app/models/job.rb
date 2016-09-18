class Job < ActiveRecord::Base
  has_many :user_jobs
  has_many :users, through: :user_jobs
  validates :job_title, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :salary, presence: true
  # validates :start_date, presence: true
end
