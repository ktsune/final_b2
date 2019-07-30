
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

  it 'I see all students grades listed for each course' do
    visit student_path(@peregrine)

  # within '.student_grades' do
      expect(page).to have_content(@peregrine_physics.grade)
      expect(page).to have_content(@mulan_physics.grade)
      expect(page).to have_content(@peregrine_world_religion.grade)
    # end
  end
  end 
end
