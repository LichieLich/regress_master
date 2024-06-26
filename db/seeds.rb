# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
  User.create name: Faker::Name.name
end

7.times do |i|
  today = DateTime.now
  Duty.create date: today - i.day - 1, user: User.all.sample
end