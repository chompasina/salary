require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_db_column "birthdate" }
  # it { should validate_presence_of :username }
  # it { should validate_uniqueness_of :username }
  it { should have_secure_password }
  # it { should validate_presence_of :email }
  it { should have_db_column "admin" }
  it { should have_db_column "first_name" }
  it { should have_db_column "last_name" }
  it { should have_db_column "cohort" }
  it { should have_db_column "slack_user_id" }
  it { should have_db_column "input_counter" }
  it { should have_many(:jobs)}

  # it "should validate an email address format" do
  #   user1 = User.new(username: "Tommasina", password: "workshard", email: "tom is@gmail", first_name: "Tommasina", last_name: "Miller")
  #   user2 = User.new(username: "Mindy", password: "workshard", email: "tom_is_here@gmail.com", first_name: "Mindy", last_name: "Miller")
  #   expect(user1.valid?).to be false
  #   expect(user2.valid?).to be true
  # end
end