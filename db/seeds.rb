# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create(
  first_name: 'Daphnee',
  last_name: 'Kbidi',
  password: 'horse12345',
  email: 'qmin@hotmail.com',
  phone_number: '0645888543',
  level: 3
)

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

  horse_pics = [
    "https://res.cloudinary.com/dxxmzjamn/image/upload/v1573563481/horses/horse/horse10_qhbmlp.png",
    "https://res.cloudinary.com/dxxmzjamn/image/upload/v1573563211/horses/horse/horse4_xo3fel.png",
    "https://res.cloudinary.com/dxxmzjamn/image/upload/v1573563211/horses/horse/horse2_lnsubs.png",
    "https://res.cloudinary.com/dxxmzjamn/image/upload/v1573563211/horses/horse/horse6_ta5qet.png",
    "https://res.cloudinary.com/dxxmzjamn/image/upload/v1573563211/horses/horse/horse1_gqtqps.png",
    "https://res.cloudinary.com/dxxmzjamn/image/upload/v1573563211/horses/horse/horse5_mxp0bx.png",
    "https://res.cloudinary.com/dxxmzjamn/image/upload/v1573563210/horses/horse/horse8_it2rgy.png",
    "https://res.cloudinary.com/dxxmzjamn/image/upload/v1573563210/horses/horse/horse3_wxnd8o.png",
    "https://res.cloudinary.com/dxxmzjamn/image/upload/v1573563210/horses/horse/horse7_lqstob.png",
    "https://res.cloudinary.com/dxxmzjamn/image/upload/v1573563210/horses/horse/horse9_igrcxk.png"
  ]

  puts 'Creating 10 fake horses...'
  10.times do |index|
    user = User.all.sample

    horse = Horse.new(
      name:    Faker::Creature::Horse.name,
      remote_photo_url:  horse_pics[index],
      breed:  Faker::Creature::Horse.breed,
      address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      price: Faker::Number.within(range: 20..60),
      user: user,
      level: rand(0..5)
      )
    horse.save!
    # puts horse_pic[count]
  end
  puts 'Finished!'
