class AddDateToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :date, :date
    remove_column :tasks, :done, :boolean, default: false
  end
end
