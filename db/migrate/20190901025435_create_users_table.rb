class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users |t|
      t.string :username
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
