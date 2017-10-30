# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.delete_all
Token.delete_all

10.times do
  user_data = {name: Faker::Name.name, email: Faker::Internet.email}
  user = User.create user_data
  2.times do 
    Token.generate user
  end
end
