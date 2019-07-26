require 'rails_helper'

RSpec.describe StudentCourse do
  describe 'relationships' do
    it {should belong_to :student}
    it {should belong_to :course}
  end

  describe 'class methods' do
    before :each do
      @peregrine = Student.create!(name: "Peregrine")
      @mulan = Student.create!(name: "Mulan")
      @jerid = Student.create!(name: "Jerid")
      @physics = Course.create!(name: "Physics")
      @psychology = Course.create!(name: "Psychology")
      @economics = Course.create(name: "Economics")
      @world_religion = Course.create(name: "World Religion")
      @peregrine_physics = @peregrine.student_courses.create(course_id: @physics.id, grade: 97.0)
      @peregrine_psychology = @peregrine.student_courses.create(course_id: @psychology.id, grade: 85.4)
      @mulan_physics = @mulan.student_courses.create(course_id: @physics.id, grade: 75.1)
      @mulan_economics = @mulan.student_courses.create(course_id: @economics.id, grade: 89.9)
      @mulan_world = @mulan.student_courses.create(course_id: @world_religion.id, grade: 96.2)
      @jerid_psychology = @jerid.student_courses.create(course_id: @psychology.id, grade: 78.2)
    end

    it '.ordered_grades' do
      expect(@physics.student_courses.ordered_grades).to eq([@peregrine_physics, @mulan_physics])
      expect(@psychology.student_courses.ordered_grades).to eq([@peregrine_psychology, @jerid_psychology])
    end
  end
end
