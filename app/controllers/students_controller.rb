class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
  end

  def enroll
    @student = Student.find(params[:id])
    @course = Course.find(params[:course_id])
    @student.student_courses.create!(course_id: params[:course_id])

    redirect_to student_path(@student.id)
  end
end
