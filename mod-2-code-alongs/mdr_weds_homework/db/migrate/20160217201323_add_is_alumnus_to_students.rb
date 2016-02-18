class AddIsAlumnusToStudents < ActiveRecord::Migration
  def change
    add_column :students, :is_alumnus, :boolean, :default => false
  end
end
