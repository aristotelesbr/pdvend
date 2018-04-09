# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  Product.create(
    name: Faker::Name.name,
    description: Faker::Lorem.sentence(3),
    product_value: Faker::Number.decimal(2),
    height: Faker::Number.between(2, 5),
    weight: Faker::Number.decimal(0),
    width: Faker::Number.between(11, 15),
    product_length: Faker::Number.between(16, 20),
  )
end
