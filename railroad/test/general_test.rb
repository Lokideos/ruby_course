require_relative 'test_support'

class GeneralTest; end

#train tests
puts "Train tests"
puts "Create general train"
train1 = Train.new(1, nil)
puts train1
puts "General train number: #{train1.number}"
puts "General train type: #{train1.type}"
puts "____________________________________________________"

puts "Create Passenger type train"
passenger_train1 = PassengerTrain.new(2, "passenger")
puts passenger_train1
puts "Passenger train number: #{passenger_train1.number}"
puts "Passenger train type: #{passenger_train1.type}"
puts "____________________________________________________"

puts "Create Passenger type train"
cargo_train1 = CargoTrain.new(3, "cargo")
puts cargo_train1
puts "Cargo train number: #{cargo_train1.number}"
puts "Cargo train type: #{cargo_train1.type}"
puts "____________________________________________________"

#car tests
puts "Car tests"
puts "Create general car"
car1 = Car.new(1, nil)
puts car1
puts "General car number: #{car1.number}"
puts "General car type: #{car1.type}"
puts "____________________________________________________"

puts "Create Passenger type car"
passenger_car1 = PassengerCar.new(2, nil)
puts passenger_car1
puts "Passenger car number: #{passenger_car1.number}"
puts "Passenger car type: #{passenger_car1.type}"
puts "____________________________________________________"

puts "Create Cargo type car"
cargo_car1 = CargoCar.new(3, nil)
puts cargo_car1
puts "Cargo car number: #{cargo_car1.number}"
puts "Cargo car type: #{cargo_car1.type}"
puts "____________________________________________________"

puts "Show existing cars"
puts "#{Car.cars}"
puts "____________________________________________________"

#station tests
# station = Station.new("spb")
# puts station
# puts Station.existing_stations