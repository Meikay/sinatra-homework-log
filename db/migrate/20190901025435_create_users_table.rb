class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users |t|
      t.string :name
      t.string :username
      t.string :password_digest
    end
  end
end
