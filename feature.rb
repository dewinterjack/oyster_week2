require "./lib/oystercard"

card = OysterCard.new

puts "\nCard balance: #{card.balance}"

card.top_up(30)

puts "Card topped up to: #{card.balance}"

card.deduct(10)

puts "Card deducted to: #{card.balance}"

card.touch_in
puts "\nCard touched in."

puts "Journey state is: #{card.in_journey?}"
