class StudentController < ApplicationController
  def show
    @student = Student.find(params[:id])
    # binding.pry
    @courses = @student.courses
  end
end
