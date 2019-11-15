# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Dropping old data...'

Reservation.destroy_all
Horse.destroy_all
User.destroy_all

puts 'Finished!'

User.create(
  first_name: 'Daphnee',
  last_name: 'Kbidi',
  password: 'horse12345',
  email: 'qmin@hotmail.com',
  phone_number: '0645888543',
  level: 3
)

nladres = ["Paddepoelseweg 183 Nijmegen", "Kerkbuurt 62 Sliedrecht", "Suze Groenewegstraat 77 Purmerend", "t Grachtje Over 194 Hoorn","Churchilllaan 84 Terneuzen", "Middelgraaf 123 Tilburg", "Coranthijnestraat 156 Groningen", "Ootmarsumsestraat 11 Oldenzaal", "Jongkindlaan 13 Alkmaar", "Dinkel 174 Heerhugowaard" ]

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

puts 'Creating 3 fake horses for Daphnee...'
  3.times do |index|
    user = User.last

    horse = Horse.new(
      name:    Faker::Creature::Horse.name,
      remote_photo_url:  horse_pics[index],
      breed:  Faker::Creature::Horse.breed,
      # address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      address: nladres.pop,
      price: Faker::Number.within(range: 20..60),
      user: user,
      level: rand(0..5),
      description: "description",
      # latitude: rand(51.0000..53.20000),
      # longitude: rand(4.000..7.000)
      )
    horse.save!
  end
  puts 'Finished!'

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

  puts 'Creating 7 fake horses...'
  7.times do |index|
    user = User.all.sample

    horse = Horse.new(
      name:    Faker::Creature::Horse.name,
      remote_photo_url:  horse_pics[index],
      breed:  Faker::Creature::Horse.breed,
      # address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      address: nladres.pop,
      price: Faker::Number.within(range: 20..60),
      user: user,
      level: rand(0..5),
      description: "description"
      # latitude: rand(51.0000..53.20000),
      # longitude: rand(4.000..7.000)
      )
    horse.save!
    # can we put latitude.within(range: 51..53,2) and longitude.within(range: 4..7)
  end
  puts 'Finished!'

  reservation_status = ["available", "booked"]
  timeslot = ["9-11am", "13-15am", "16-18am"]

  puts 'Creating 10 fake reservations'
  25.times do |index|
    horse = Horse.all.sample
    user = User.all.sample
    reservation = Reservation.new(
      status: reservation_status.sample,
      horse: horse,
      start_time: Faker::Date.forward(days: 23),
      timeslot: timeslot.sample
      )
    unless reservation.status == "available"
      reservation.user = user
    end
    reservation.save!
  end
  puts 'Finished'

