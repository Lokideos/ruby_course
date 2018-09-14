class Train
  attr_reader :number, :type, :cars_quantity, :speed, :route

  @@trains = []

  def initialize(number, type, cars_quantity)
    @number = number
    type == "passenger" ? @type = type : @type = "freight"
    @cars_quantity = cars_quantity
    @speed = 0
    @@trains << self
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

  def move_on_route(direction)
    current_position = current_route_stations.find_index(@current_station)
    current_route_stations[current_position].departure_of_train(self)
    current_route_stations[current_position + 1].arrival_of_train(self) if direction == "forward"
    current_route_stations[current_position - 1].arrival_of_train(self) if direction == "back"
  end

  def neighbors_station
    current_position = current_route_stations.find_index(@current_station)
    neighbors = []
    neighbors.push(current_route_stations[current_position - 1]) unless current_position - 1 <= 0
    neighbors.push(current_route_stations[current_position])
    neighbors.push(current_route_stations[current_position + 1]) unless current_position + 1 >= current_route_stations.length + 1
    neighbors
  end

  def self.existing_trains
    @@trains
  end

  private

  def current_route_stations
    self.route.stations
  end
end