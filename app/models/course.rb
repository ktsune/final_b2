class Course < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :students, through: :student_courses

  # def enrolled
  #   binding.pry
  #   self.students.where(id: course_id)
  # end
end
