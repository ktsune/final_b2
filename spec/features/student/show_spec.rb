require 'rails_helper'

RSpec.describe 'User' do
  describe 'I visit a student show page' do
    before :each do
      @peregrine = Student.create!(name: "Peregrine")
      @mulan = Student.create!(name: "Mulan")
      @physics = Course.create!(name: "Physics")
      @psychology = Course.create!(name: "Psychology")
      @economics = Course.create(name: "Economics")
      @world_religion = Course.create(name: "World Religion")
      @peregrine_physics = @peregrine.student_courses.create(course_id: @physics.id, grade: 97.0)
      @peregrine_world_religion = @peregrine.student_courses.create(course_id: @world_religion.id, grade: 97.0)
      @mulan_physics = @mulan.student_courses.create(course_id: @physics.id, grade: 75.1)
    end

    it 'I see student name' do
      visit student_path(@peregrine)

      within "#name-#{@peregrine.id}" do
        expect(page).to have_content(@peregrine.name)
      end

      visit student_path(@mulan)

      within "#name-#{@mulan.id}" do
        expect(page).to have_content(@mulan.name)
      end
    end

    it "I can see the student's courses, and grades for each course" do
      visit student_path(@peregrine)

      # within ".courses" do
        expect(page).to have_content(@peregrine.courses.name)
        expect(page).to have_content(@peregrine_physics.grade)
      # end

      visit student_path(@mulan)

      # within ".courses" do
        expect(page).to have_content(@mulan.courses.name)
        expect(page).to have_content(@mulan_physics.grade)
      # end
    end

    it "I can enroll in a course" do
      visit student_path(@peregrine)

      expect(page).to have_content(@physics.name)

      fill_in "Course Id", with: @world_religion.id
      click_on "Submit"

      expect(page).to have_content(@physics.name)
      expect(page).to have_content(@world_religion.name)
    end

  end
end
