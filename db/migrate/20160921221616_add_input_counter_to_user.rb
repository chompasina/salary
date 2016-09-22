class AddInputCounterToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :input_counter, :integer, :default => 0
  end
end
