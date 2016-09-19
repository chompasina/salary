class AddReferenceToJobs < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, :user, foreign_key: true
  end
end
