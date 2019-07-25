require 'rails_helper'

RSpec.describe 'User' do
  describe 'I visit a student show page' do
    before :each do
      @peregrine = Student.create!(name: "Peregrine")
      @mulan = Student.create!(name: "Mulan")
      visit student_path(@peregrine)
    end

    it 'I see student name' do

      expect(page).to have_content(@peregrine.name)
    end

    it 'I can see student courses, and grades for each course' do

    end
  end 
end
