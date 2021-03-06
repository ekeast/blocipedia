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

10.times do
  Wiki.create!(
  user: users.sample,
  title: Faker::Hipster.sentence,
  body: Faker::Lorem.paragraph,
  private: true
  )
end

10.times do
  Wiki.create!(
  user: users.sample,
  title: Faker::Hipster.sentence,
  body: Faker::Lorem.paragraph,
  private: false
  )
end

#user = User.find_or_create :username => 'ekeast', :email => 'ekeast328@gmail.com', :password => 'password'

#user = User.new
#user.username = 'ekeast'
#user.email = 'ekeast328@gmail.com'
#user.password = 'password'
#user.skip_confirmation!
#user.save!

puts "Seeds finished!"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
