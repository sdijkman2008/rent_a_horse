# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

  puts 'Creating 10 fake users...'
  10.times do
    user = User.new(
      first_name:    Faker::Company.name,
      last_name:  Faker::GreekPhilosophers.name,
      password: Faker::Alphanumeric.alphanumeric(number: 10),
      email:  Faker::Internet.email,
      phone_number: "06-#{Faker::PhoneNumber.subscriber_number(length: 8)}",
      level:  rand(0..5)
    )
    user.save!
  end
  puts 'Finished!'

  puts 'Creating 10 fake horses...'
  10.times do
    horse = Horse.new(
      name:    Faker::Creature::Horse.name,
      breed:  Faker::Creature::Horse.breed,
      address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      price: Faker::Number.within(range: 20..60),
      level:  rand(0..5)
      )
    horse.save!
  end
  puts 'Finished!'
