# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

usernames = ["alice", "bob", "carol"]

usernames.each do |username|
  user = User.create
  user.username = username
  user.email = "#{username}@example.com"
  user.password = "password"
  user.save
end

puts "There are now #{User.count} users in the database."

recipe_info = [
  {
    :title => "German Chocolate Cake",
    :image => "https://www.culinaryhill.com/wp-content/uploads/2018/09/German-Chocolate-Cake-LR-04-Culinary-Hill.jpg",
    :instruction => "Uses eggs, evaporated milk, sugar, light brown sugar, unsalted butter, vanilla extract, shredded unsweetened coconut..."
  },
  {
    :title => "Lemon Meringue Cookies",
    :image => "https://www.homemadeinterest.com/wp-content/uploads/2018/04/Lemon-Meringue-Cookies_-IG.jpg",
    :instruction => "Egg whites, cream of tartar, salt, fine sugar, lemon extract."
  },
  {
    :title => "Shortbread Cookies",
    :image => "https://www.fifteenspatulas.com/wp-content/uploads/2015/12/Shortbread-Cookies-Fifteen-Spatulas-1-640x427.jpg",
    :instruction => "Salted butter, confectioner's sugar, vanilla extract, all purpose flour, milk."
  },
  {
    :title => "Homemade Reeses Cups",
    :image => "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/fb9d7e9596b6441086e68fe5eee87650/BFV12524_3-IngredientNo-BakeDesserts-FB1080SQ.jpg",
    :instruction => "Powdered sugar, creamy peanut butter, chocolate"
  }
]

users = User.all

users.each do |user|
  user.recipes.create recipe_info
end

puts "There are now #{Recipe.count} recipes in the database."

recipes = Recipe.all

recipes.each do |recipe|
  rand(3).times do
    comment = recipe.comments.build
    comment.user = users.sample
    comment.body = Faker::Quote.yoda
    comment.save
  end
end

puts "There are now #{Comment.count} comments in the database."

recipes.each do |recipe|
  users.sample(rand(users.count)).each do |user|
    like = recipe.likes.build
    like.user = user
    like.save
  end
end

puts "There are now #{Like.count} likes in the database."

