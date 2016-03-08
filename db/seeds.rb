# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = %w(Tina Yassi Bruce Hannah Mariel Emily Eric Bryan Chris Marcus Terrance Kristen Sophia Deas Lee Jordan)

users.each do |x|
  User.create(username: x, email: "#{x}@ttsproject.com", password: "password")
end

puts User.count