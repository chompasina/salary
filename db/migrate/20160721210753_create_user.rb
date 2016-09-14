class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.date :birthdate
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :name
    end
  end
end
