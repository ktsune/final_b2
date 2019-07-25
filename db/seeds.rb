# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.destroy_all
Course.destroy_all

peregrine = Student.create!(name: "Peregrine")
mulan = Student.create!(name: "Mulan")

physics = Course.create!(name: "Physics")
psychology = Course.create!(name: "Psychology")
economics = Course.create(name: "Economics")
world_religion = Course.create(name: "World Religion")

peregrine.courses << physics
peregrine.courses << psychology
mulan.courses << economics
mulan.courses << world_religion
