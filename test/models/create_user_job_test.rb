require "test_helper"

class CreateUserJobTest < ActiveSupport::TestCase
  def create_user_job
    @create_user_job ||= CreateUserJob.new
  end

  def test_valid
    assert create_user_job.valid?
  end
end
