require 'rails_helper'

RSpec.describe CourseStudent do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {should belong_to(:students)}
    it {should belong_to(:courses)}
  end
end
