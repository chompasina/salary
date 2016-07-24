class AddCohortColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :cohort, :integer
  end
end
