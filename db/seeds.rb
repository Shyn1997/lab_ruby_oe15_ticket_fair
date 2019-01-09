10.times do |n|
  name = Faker::Name.first_name
  phone_number = Faker::Code.npi
  address = Faker::Address.city
  info = Faker::Lorem.sentence(5)
  image = "http://wikidulich.org/wp-content/uploads/2018/07/Logo-fanxipan-bus.jpg"
  Garage.create! name: name,
  phone_number: phone_number,
  address: address,
  info: info,
  image: "http://wikidulich.org/wp-content/uploads/2018/07/Logo-fanxipan-bus.jpg"
end

10.times do |n|
  license_plate = Faker::Code.nric
  seat_form = rand(1..2)
  seat_amount = rand(24..45)
  garage_id = rand(1..10)
  Coach.create! license_plate: license_plate,
  seat_form: seat_form,
  types: "Xe giường nằm",
  seat_amount: seat_amount,
  garage_id: garage_id
end
# Seat---------------------
18.times do |n|
  code = "C#{n+1}"
  Seat.create!(code: code,
               types: 1,
               coach_id: 1,
    )
end

18.times do |n|
  code = "C#{n+19}"
  Seat.create!(code: code,
               types: 2,
               coach_id: 1,
    )
end

10.times do |n|
  code = "C#{n+1}"
  Seat.create!(code: code,
               types: 1,
               coach_id: 2,
    )
end

10.times do |n|
  code = "C#{n+11}"
  Seat.create!(code: code,
               types: 2,
               coach_id: 2,
    )
end
#Seat---------------------
Trip.create! time_start: Time.now,
             time_finish: Time.now,
             city_start: "Hà Nội",
             city_finish: "Hà Giang",
             coach_id: 1,
             is_repeated: true

Trip.create! time_start: Time.now,
             time_finish: Time.now,
             city_start: "Hà Nội",
             city_finish: "Nghệ An",
             coach_id: 2,
             is_repeated: true

Trip.create! time_start: Time.now,
             time_finish: Time.now,
             city_start: "Hà Nội",
             city_finish: "Thanh Hóa",
             coach_id: 3,
             is_repeated: true

Trip.create! time_start: Time.now,
             time_finish: Time.now,
             city_start: "Hà Nội",
             city_finish: "Sapa",
             coach_id: 4,
             is_repeated: true

Trip.create! time_start: Time.now,
             time_finish: Time.now,
             city_start: "Hà Nội",
             city_finish: "Hòa Bình",
             coach_id: 5,
             is_repeated: true

Customer.create! name: "Shyn",
                 phone_number: "0981599931",
                 email: "kimtacgubin@gmail.com"

Customer.create! name: Faker::Name.name,
                 phone_number: "0984591600",
                 email: Faker::Internet.email

Customer.create! name: Faker::Name.name,
                 phone_number: Faker::PhoneNumber.phone_number,
                 email: Faker::Internet.email

Customer.create! name: Faker::Name.name,
                 phone_number: Faker::PhoneNumber.phone_number,
                 email: Faker::Internet.email

Customer.create! name: Faker::Name.name,
                 phone_number: Faker::PhoneNumber.phone_number,
                 email: Faker::Internet.email

Ticket.create! customer_id: 1,
               trip_id: rand(1..5),
               status: 2,
               bus_stop: Faker::Address.city_prefix,
               code: "0912SHYN",
               seat_id: rand(1..30)

Ticket.create! customer_id: 1,
               trip_id: rand(1..5),
               status: 1,
               bus_stop: Faker::Address.city_prefix,
               code: "0912SHYN1",
               seat_id: rand(1..30)

Ticket.create! customer_id: 1,
               trip_id: rand(1..5),
               status: 2,
               bus_stop: Faker::Address.city_prefix,
               code: "0912SHYN2",
               seat_id: rand(1..30)

Ticket.create! customer_id: 1,
               trip_id: rand(1..5),
               status: 2,
               bus_stop: Faker::Address.city_prefix,
               code: "0912SHYN3",
               seat_id: rand(1..30)

Ticket.create! customer_id: 2,
               trip_id: rand(1..5),
               status: 2,
               bus_stop: Faker::Address.city_prefix,
               code: "0912SHYN4",
               seat_id: rand(1..30)

Ticket.create! customer_id: 2,
               trip_id: rand(1..5),
               status: 2,
               bus_stop: Faker::Address.city_prefix,
               code: "0912SHYN5",
               seat_id: rand(1..30)

# 18.times do |n|
#   code = "C#{n+1}"
#   Seat.create!(code: code,
#                types: 1,
#                coach_id: 1,
#     )
# end

# 18.times do |n|
#   code = "C#{n+19}"
#   Seat.create!(code: code,
#                types: 2,
#                coach_id: 1,
#     )
# end

# 10.times do |n|
#   code = "C#{n+1}"
#   Seat.create!(code: code,
#                types: 1,
#                coach_id: 2,
#     )
# end

# 10.times do |n|
#   code = "C#{n+11}"
#   Seat.create!(code: code,
#                types: 2,
#                coach_id: 2,
#     )
# end

Customer.create(name: "Thao")
Trip.create(time_start: "2018-12-28 21:02:59",time_finish: "2018-12-28 23:02:59", city_start: "Hà Nội", city_finish: "Nghệ An", coach_id: 2, fare: 200000)
Trip.create(time_start: Time.now() + 8.hour, time_finish: Time.now() + 11.hour, city_start: "Hà Nội", city_finish: "Nghệ An", coach_id: 1, fare: 200000)
Ticket.create(trip_id: 1, customer_id: 1, status: 2, seat_id: 138, code: "123ABC")
Trip.create(time_start: "2019-01-09 17:00:00", time_finish: "2019-01-09 22:00:00", city_start: "Hà Nội", city_finish: "Nghệ An", coach_id: 1, fare: 200000)
