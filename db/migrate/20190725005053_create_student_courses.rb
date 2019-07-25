class CreateStudentCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :student_courses do |t|
      t.references :students, foreign_key: true
      t.references :courses, foreign_key: true
    end
  end
end
