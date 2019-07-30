class Student < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :courses, through: :student_courses

  def enrolled
    binding.pry
    self.student_courses.where(id: course_id)
  end
end
