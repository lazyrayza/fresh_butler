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

puts "creating bookings"
Booking.destroy_all

5.times do

  bookings = Booking.create!(
    start_date: Faker::Date.backward(rand(1..15)),
    end_date: Faker::Date.forward(rand(16..25)),
    butler_id: User.all.sample.id,
    client_id: User.all.sample.id
    )
end

puts "finished with bookings database!"


puts "creating Butlers"

25.times do

  butlers = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.state,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    butler: true
    )
end











