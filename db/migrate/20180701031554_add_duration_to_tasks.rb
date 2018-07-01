class AddDurationToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :duration_in_hours, :decimal
  end
end
