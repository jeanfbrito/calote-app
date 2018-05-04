class CreateJoinTableEventuser < ActiveRecord::Migration[5.2]
  def change
    create_table :events_users do |t|
      t.index [:event_id, :user_id]
      t.integer :event_id
      t.integer :user_id
      t.boolean :confirmed, default: false
    end
  end
end
