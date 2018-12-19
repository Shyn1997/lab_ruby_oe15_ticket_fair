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

Customer.create(name: "Thao")
Ticket.create(trip_id: 1, customer_id: 1, status: 1, seat_id: 138)

