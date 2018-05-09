class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.index [:user_id, :task_id]
      t.references :user
      t.references :task
      t.text :body
      t.timestamps
    end
  end
end
