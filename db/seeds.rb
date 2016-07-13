# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(first_name: "Jorge", last_name: "Ramirez", password: "hunter2", email: "example@gmail.com")
user1 = User.create!(first_name: "David", last_name: "Vega", password: "hunter2", email: "sample@hotmail.com")
admin = User.create!(first_name: "Admin", last_name: "Account", password: "hunter2", email: "admin@admin.com", admin?: true)


subcheckit = Subcheckit.create!(name: "Main", category: "General")
subcheckit2 = Subcheckit.create!(name: "Articles", category: "Random")
no_moderators = Subcheckit.create!(name: "No Moderator", category: "Test")


5.times do
  user.posts.create!(content: Faker::ChuckNorris.fact, title: Faker::Hipster.word, subcheckit_id: subcheckit.id)
end
