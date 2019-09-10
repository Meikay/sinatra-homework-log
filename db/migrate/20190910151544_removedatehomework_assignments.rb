class RemovedatehomeworkAssignments < ActiveRecord::Migration
  def change
    remove_column :homework_assignments, :date
  end
end
