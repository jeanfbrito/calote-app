class CreateForums < ActiveRecord::Migration[5.2]
  def change
    create_table :forums do |t|
      t.string :name
      t.integer :number, default: 0

      t.timestamps
    end
  end
end
