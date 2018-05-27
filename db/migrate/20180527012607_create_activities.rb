class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :task, foreign_key: true
      t.date :date
      t.decimal :hours

      t.timestamps
    end
  end
end
