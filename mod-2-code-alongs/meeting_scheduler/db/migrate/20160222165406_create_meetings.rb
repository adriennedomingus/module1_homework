class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.text :name
      t.text :date
      t.integer :meetable_id
      t.text :meetable_type

      t.timestamps null: false
    end
  end
end
