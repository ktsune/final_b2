class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course

  def self.ordered_grades
    self.order(grade: :desc)
  end
end
