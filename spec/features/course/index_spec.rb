require 'rails_helper'

RSpec.describe 'User' do
  describe 'I visit a course index page' do
    before :each do
      @peregrine = Student.create!(name: "Peregrine")
      @mulan = Student.create!(name: "Mulan")
      @physics = Course.create!(name: "Physics")
      @psychology = Course.create!(name: "Psychology")
      @economics = Course.create(name: "Economics")
      @world_religion = Course.create(name: "World Religion")
      @peregrine_physics = @peregrine.student_courses.create(course_id: @physics.id, grade: 97.0)
      @peregrine_psychology = @peregrine.student_courses.create(course_id: @psychology.id, grade: 85.4)
      @mulan_physics = @mulan.student_courses.create(course_id: @physics.id, grade: 75.1)
      @mulan_economics = @mulan.student_courses.create(course_id: @economics.id, grade: 89.9)
      @mulan_world = @mulan.student_courses.create(course_id: @world_religion.id, grade: 96.2)
      visit courses_path
    end

    it 'I see each course name' do

    within '.course_name' do
        expect(page).to have_content(@psychology.name)
        expect(page).to have_content(@physics.name)
        expect(page).to have_content(@economics.name)
        expect(page).to have_content(@world_religion.name)
      end
    end

    it 'I see all students grades listed for each course' do

    within '.student_grades' do
        expect(page).to have_content(@peregrine_physics.grade)
        expect(page).to have_content(@peregrine_psychology.grade)
        expect(page).to have_content(@mulan_physics.grade)
        expect(page).to have_content(@mulan_economics.grade)
        expect(page).to have_content(@mulan_world.grade)
      end
    end
  end
end
