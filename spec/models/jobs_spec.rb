require 'rails_helper'

RSpec.describe Job, type: :model do
  it { should have_db_column "job_title"}
  it { should have_db_column "company"}
  it { should have_db_column "city"}
  it { should have_db_column "state"}
  it { should have_db_column "salary"}
  it { should have_db_column "start_date"}
  it { should have_db_column "end_date"}
  it { should have_db_column "current_job"}
end