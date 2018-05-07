class CreateJoinTableSubjectsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subjects, :users do |t|
      t.index [:subject_id, :user_id]
    end
  end
end
