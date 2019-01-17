# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

saajid1 = User.create(name: "Saajid", email: "saajid10khan@stjohns.edu", password: "dragon", funds: 1000, address: "Jamaica, NY")

stock1 = Portfolio.create(user_id: saajid1.id, name: "Amazon", symbol: "AMZN", price_when_purchased: 1687.78, amount: 60, sector: "Tech", date_bought: DateTime.new(2019, 1, 2, 3))
puts 'hello'
