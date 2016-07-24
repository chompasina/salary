class CreateJobsTable < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :company
      t.string :city
      t.string :state
      t.integer :salary
      t.date :start_date
      t.boolean :current_job
      t.date :end_date

      t.timestamps null:false
    end
  end
end
