class CreateHomeworkAssignments < ActiveRecord::Migration
  def change
    create_table :homework_assignment do |t|
      t.string :subject
      t.string :notes
      t.integer :date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
