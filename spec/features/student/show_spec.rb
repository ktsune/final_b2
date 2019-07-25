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

    it 'I can see student courses, and grades for each course' do
      visit student_path(@peregrine)

      within ".courses" do
        expect(page).to have_content(@peregrine.courses.name)
      end

      visit student_path(@mulan)

      within ".courses" do
        expect(page).to have_content(@mulan.courses.name)
      end
    end
  end
end
