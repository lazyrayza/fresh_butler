require 'faker'

puts '####################################'

puts 'Cleaning Users database...'
User.destroy_all

puts 'Creating Users database...'

5.times do
  users = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

puts 'Finished with Users database!'

puts '####################################'

puts 'Cleaning Bookings database...'
Booking.destroy_all


20.times do

puts 'Creating Bookings database...'

  bookings = Booking.create!(
    start_date: Faker::Date.backward(rand(1..15)),
    end_date: Faker::Date.forward(rand(16..25)),
    butler_id: User.all.sample.id,
    client_id: User.all.sample.id,
    description: Faker::Lorem.characters(150),
    status: true
    )
end

puts 'Finished with Bookings database!'

puts '####################################'

puts 'Creating Butlers database...'

25.times do

  butlers = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.state,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    butler: true,
    languages: Faker::ProgrammingLanguage.name,
    skills: Faker::Esport.game,
    description: Faker::Hipster.paragraph
    )
end
puts "finished with butlers !"
puts "reviews Butlers"

20.times do


  reviews = Review.create!(
    description: Faker::Lorem.characters(150) ,
    rating: rand(1..5),
    butler_id: User.all.sample.id,
    client_id: User.all.sample.id
    )
end
puts 'All done!'

puts "finished with reviews !"




