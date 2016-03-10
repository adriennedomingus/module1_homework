class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.text :text
      t.references :level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
