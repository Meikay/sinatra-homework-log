class CreateHomeworkAssignments < ActiveRecord::Migration
  def change
    create_table :homework_assignments do |t|
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
