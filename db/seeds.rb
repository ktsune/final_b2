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
jerid = Student.create!(name: "Jerid")

physics = Course.create!(name: "Physics")
psychology = Course.create!(name: "Psychology")
economics = Course.create(name: "Economics")
world_religion = Course.create(name: "World Religion")

# peregrine.courses << physics
# peregrine.courses << psychology
#
# mulan.courses << physics
# mulan.courses << economics
# mulan.courses << world_religion
#
# jerid.courses << economics
# jerid.courses << psychology
# jerid.courses << world_religion

peregrine.student_courses.create(course_id: physics.id, grade: 97.0)
peregrine.student_courses.create(course_id: psychology.id, grade: 85.4)

mulan.student_courses.create(course_id: physics.id, grade: 75.1)
mulan.student_courses.create(course_id: economics.id, grade: 89.9)
mulan.student_courses.create(course_id: world_religion.id, grade: 96.2)

jerid.student_courses.create(course_id: economics.id, grade: 56.5)
jerid.student_courses.create(course_id: psychology.id, grade: 78.2)
jerid.student_courses.create(course_id: world_religion.id, grade: 95.8)
