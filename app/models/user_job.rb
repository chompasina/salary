class UserJob < ActiveRecord::Base
  belongs_to :job
  belongs_to :user

  validates :user, presence: true
  validates :job, presence: true
end
