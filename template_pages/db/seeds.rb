# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Jeff", email: "jeff_malganis@hotmail.com", password: "123456")
User.create(name: "Kabal", email: "kabal@hotmail.com", password: "123456")
User.create(name: "javar the forty", email: "j4@hotmail.com", password: "123456")
User.create(name: "Mari", email: "mari@hotmail.com", password: "123456")
User.create(name: "Marley", email: "marle@hotmail.com", password: "123456")

Forum.create(name: "forum 1")
Forum.create(name: "forum 2")
Forum.create(name: "forum 3")
