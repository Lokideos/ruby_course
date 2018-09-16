require_relative 'test_support'

class GeneralTest; end

#train tests

puts "Train tests"
puts "Create general train"
train1 = Train.new(1, nil, 10)
puts train1
puts "General train number: #{train1.number}"
puts "General train type: #{train1.type}"
puts "General train cars quantity: #{train1.cars_quantity}"
puts "____________________________________________________"

puts "Create Passenger type train"
passenger_train1 = PassengerTrain.new(2, "passenger", 10)
puts passenger_train1
puts "Passenger train number: #{passenger_train1.number}"
puts "Passenger train type: #{passenger_train1.type}"
puts "Passenger train cars quantity: #{passenger_train1.cars_quantity}"
puts "____________________________________________________"

#station tests
# station = Station.new("spb")
# puts station
# puts Station.existing_stations