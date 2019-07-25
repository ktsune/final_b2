class CourseController < ApplicationController
  def index
    @courses = Course.all
    binding.pry
  end
end
