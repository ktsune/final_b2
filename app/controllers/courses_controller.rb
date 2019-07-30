class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def unenroll
    @course = Course.find(params[:id])
    @students = @course.students

    @student = Student.find(params[:student_id])
    # @student_id = @course.students.map do |student|
    #   student.id
    # end
    # binding.pry
    # enrolled
    binding.pry
    @student.enrolled.student_courses.destroy(student_id: @student.id, id: params[:id])

    redirect_to course_path(@course.id)
  end
end
