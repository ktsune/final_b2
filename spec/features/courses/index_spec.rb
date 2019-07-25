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
      visit course_path
    end

    it 'I see each course name' do

      expect(page).to have_content(@physics.name)
      expect(page).to have_content(@psychology.name)
      expect(page).to have_content(@economics.name)
      expect(page).to have_content(@world_religion.name)
    end 
  end
end
