class CreateTasksUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks_users do |t|
      t.index [:task_id, :user_id]
      t.integer :task_id
      t.integer :user_id
    end
  end
end
