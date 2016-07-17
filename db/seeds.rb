# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user = User.create!(first_name: "Jorge", last_name: "Ramirez", password: "hunter2", email: "example@gmail.com")
# user1 = User.create!(first_name: "David", last_name: "Vega", password: "hunter2", email: "sample@hotmail.com")
# admin = User.create!(first_name: "Admin", last_name: "Account", password: "hunter2", email: "admin@admin.com", admin?: true)
#
#
# subcheckit = Subcheckit.create!(name: "Main", category: "General")
# subcheckit2 = Subcheckit.create!(name: "Articles", category: "Random")
# no_moderators = Subcheckit.create!(name: "No Moderator", category: "Test")
#
# # First subcheckit
# 5.times do
#   user.posts.create!(content: Faker::ChuckNorris.fact, title: Faker::Hipster.word, subcheckit_id: subcheckit.id)
# end
#
# 5.times do
#   user1.posts.create!(content: Faker::Hipster.sentence, title: Faker::Hipster.word, subcheckit_id: subcheckit.id)
# end
#
# # Second subcheckit
# 5.times do
#   user.posts.create!(content: Faker::ChuckNorris.fact, title: Faker::Hipster.word, subcheckit_id: subcheckit2.id)
# end
#
# 5.times do
#   user1.posts.create!(content: Faker::Hipster.sentence, title: Faker::Hipster.word, subcheckit_id: subcheckit2.id)
# end

user = User.create!(first_name: "Jorge", last_name: "Ramirez", password: "hunter2", email: "example@gmail.com")
user1 = User.create!(first_name: "David", last_name: "Vega", password: "hunter2", email: "sample@hotmail.com")
admin = User.create!(first_name: "Admin", last_name: "Account", password: "hunter2", email: "admin@admin.com", admin?: true)


subreddit = Subcheckit.create!(name: "Main", category: "General")
subreddit2 = Subcheckit.create!(name: "Articles", category: "Random")
no_moderators = Subcheckit.create!(name: "No Moderator", category: "Test")


# First subcheckit
post = user1.posts.create!(content: "This is an amazing post!", title: "Front Page!", subcheckit_id: subreddit.id)
post2 = user.posts.create!(content: "Can't stop posting!", title: "Front Page!", subcheckit_id: subreddit.id)
post3 = user1.posts.create!(content: "I'm obsessed with this website!", title: "Check this out!", subcheckit_id: subreddit.id)
post4 = user.posts.create!(content: "I'll be so popular", title: "Relevant Stuff", subcheckit_id: subreddit.id)
post5 = user1.posts.create!(content: "I need to slow down", title: "Memes and Cats", subcheckit_id: subreddit.id)

# Second subcheckit

post6 = user1.posts.create!(content: "This is an amazing post!", title: "Second subcheckit!", subcheckit_id: subreddit2.id)
post7 = user.posts.create!(content: "Can't stop posting!", title: "New Stuff", subcheckit_id: subreddit2.id)
post8 = user1.posts.create!(content: "I'm obsessed with this website!", title: "YES!", subcheckit_id: subreddit2.id)
post9 = user.posts.create!(content: "I'll be so popular", title: "Second subcheckit", subcheckit_id: subreddit2.id)
post10 = user1.posts.create!(content: "I need to slow down", title: "Memes and Cats", subcheckit_id: subreddit2.id)


moderator = Moderator.create!(user_id: user.id, subcheckit_id: subreddit.id)
moderator = Moderator.create!(user_id: user.id, subcheckit_id: subreddit2.id)

# votes

vote = user.votes.create!(post_id: post.id, vote: 1)
vote1 = user1.votes.create!(post_id: post.id, vote: 1)
vote2 = admin.votes.create!(post_id: post.id, vote: 1)

comment = post.comments.create!(user_id: admin.id, comment: "This is just a simple comment, mostly positive criticism")
comment1 = post.comments.create!(user_id: admin.id, comment: "This is just a simple comment, mostly positive criticism")
comment2 = post.comments.create!(user_id: user.id, comment: "This is just a simple comment, mostly positive criticism")
comment3 = post.comments.create!(user_id: user1.id, comment: "This is just a simple comment, mostly positive criticism")
