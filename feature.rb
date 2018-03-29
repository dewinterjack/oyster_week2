require "./lib/oystercard"

card = OysterCard.new

puts "\nCard balance: #{card.balance}"

card.top_up(30)

puts "Card topped up to: #{card.balance}"

card.send(:deduct, 20)

puts "Card deducted to: #{card.balance}"

card.touch_in("Baker Street")
puts "\nCard touched in at station #{card.station}."

puts "Journey state is: #{card.in_journey?}"
