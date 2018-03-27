require "lib/oystercard"

card = OysterCard.new
card.top_up(30)

puts "Card topped up to : #{card.balance}"

card.deduct(10)

puts "Card deducted to : #{card.balance}"
