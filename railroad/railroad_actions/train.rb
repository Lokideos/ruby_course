class Train
  attr_reader :number, :type, :cars_quantity, :speed, :route

  def initialize(number, type, cars_quantity)
    @number = number
    @type = type if type == "freight" || type == "passenger"
    @cars_quantity = cars_quantity
    @speed = 0
  end

  def increase_speed
    @speed += 10
  end

  def decrease_speed
    @speed -= 10 unless @speed == 0
  end

  def attach_car
    @cars_quantity +=1 if @speed == 0
  end

  def detach_car
    @cars_quantity -=1 if @speed == 0
  end

  def assign_route(route)
    @route = route
    current_route_stations.first.arrival_of_train(self)
    @current_station = route.stations.first
  end

  def move_on_route
    current_position = current_route_stations.find_index(@current_station)
    transaction do
      current_route_stations[current_position].departure_of_train(self)
      current_route_stations[current_position + 1].arrival_of_train(self)
    end
  end

  def neighbors_station
    current_position = current_route_stations.find_index(@current_station)
    neighbors = []
    neighbors.push(current_route_stations[current_position - 1]) unless current_position - 1 <= 0
    neighbors.push(current_route_stations[current_position])
    neighbors.push(current_route_stations[current_position + 1]) unless current_position + 1 >= self.route.station.length + 1
  end

  private

  def current_route_stations
    self.route.stations
  end
end