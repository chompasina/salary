class AddExtensionToUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension :citext
    change_column :users, :first_name, :citext
    change_column :users, :last_name, :citext
  end
end
