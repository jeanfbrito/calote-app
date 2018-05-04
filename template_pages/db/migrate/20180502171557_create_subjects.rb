class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :description
      t.integer :time
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
