class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :lastname
      t.string :password
      t.string :username
      t.string :email
    end
  end
end
