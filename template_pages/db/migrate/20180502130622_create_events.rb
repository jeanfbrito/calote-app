class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.string :color
      t.string :number
      t.text :description
      t.integer :president_id
      t.integer :secretary_id
      t.integer :forum_id
      t.text :address
      t.string :location
      t.integer :situation

      t.timestamps
    end
  end
end
