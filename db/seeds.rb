
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
  
end

Shelf.create(user_id:1)

20.times do |n|
Shelf.create(user_id:n)
Shelf.create(user_id:n)
Shelf.create(user_id:n)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

#Items database

#Books
Book.create(title:"Moby Dick", author: "Herman Melville", year: "1851", genre: "Adventure")
Book.create(title:"Ruby on Rails Tutorial", author: "Michael Hartl", year: "2015", genre: "Manual")
Book.create(title:"The Da Vinci Code", author: "Dan Brown", year: "2003", genre: "Mystery, Thriller")
Book.create(title:"The Maze Runner", author: "James Dashner", year: "2009", genre: "Dystopian")
Book.create(title:"Fight Club", author: "Chuck Palahniuk", year: "1996", genre: "Drama")

#Films
Film.create(title:"Titanic", author: "James Cameron", year: "1997", genre: "Drama, Romance")
Film.create(title:"Master and Commander", author: "Peter Weir", year: "2003", genre: "Action, Adventure, Drama")
Film.create(title:"Matrix", author: "Andy Wachowski", year: "1999", genre: "Action, Sci-Fi")
Film.create(title:"Frozen", author: "Chris Buck", year: "2013", genre: "Animation")
Film.create(title:"The Wolf of Wall Street", author: "Martin Scorsese", year: "2013", genre: "Biography, Comedy, Crime")


#Games
Game.create(title:"Half-Life 2", author: "Valve", year: "2004", genre: "Sci-Fi, FPS")
Game.create(title:"The Legend of Zelda - Skyward Sword", author: "Nintendo", year: "2011", genre: "Action, RPG")
Game.create(title:"The Last of Us", author: "Naughty Dog", year: "2013", genre: "Survival Horror")
Game.create(title:"The Elder Scrolls V - Skyrim", author: "Bethesda", year: "2011", genre: "Action RPG")
Game.create(title:"Assassin's Creed 3", author: "Ubisoft", year: "2012", genre: "Adventure, Stealth")
