class CoursesController < ApplicationController

  def index
    @courses = Course.all
    # binding.pry
    @students = @courses.map do |course|
      course.students
    end 
  end

end
