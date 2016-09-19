class Job < ActiveRecord::Base
  belongs_to :user
  validates :job_title, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :salary, presence: true
  # validates :start_date, presence: true
end
