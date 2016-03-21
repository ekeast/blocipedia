# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do
  User.create!(
  username: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password(8, 15)
  )
end

users = User.all

20.times do
  Wiki.create!(
  user: users.sample,
  title: Faker::Hipster.sentence,
  body: Faker::Lorem.paragraph,
  private: Faker::Boolean.boolean
  )
end

User.find_or_create!(
  username: 'ekeast',
  email: 'ekeast328@gmail.com',
  password: 'password'
)

puts "Seeds finished!"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
