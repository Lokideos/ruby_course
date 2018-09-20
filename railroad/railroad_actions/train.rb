class Train
  attr_reader :number, :type, :speed, :route, :cars

  @@trains = []

  def initialize(number, type)
    @number = number
    type == "passenger" ? @type = type : @type = "cargo"
    @speed = 0
    @cars = []
    @@trains << self
  end

  def increase_speed
    @speed += 10
  end

  def decrease_speed
    @speed -= 10 unless @speed == 0
  end

  def can_attach_or_detach_car?(car)
    if car
      self.speed == 0 && car.type.to_s == self.type.to_s
    end
  end

  def attach_car(car)
    @cars.push(car) if can_attach_or_detach_car?(car)
  end

  def detach_car(car)
    @cars.delete(car) if can_attach_or_detach_car?(car)
  end

  def assign_route(route)
    @route = route
    current_route_stations.first.arrival_of_train(self)
    @current_station = route.stations.first
  end

  def move_forward_on_route
    current_position = position_on_route

    if next_station_exists?(current_position)
      train_departure(current_position)
      next_station(current_position).arrival_of_train(self)
      @current_station = next_station(current_position)
    end
  end

  def move_back_on_route
    current_position = position_on_route

   if previous_station_exists?(current_position)
      train_departure(current_position)
      previous_station(current_position).arrival_of_train(self)
      @current_station = previous_station(current_position)
    end
  end

  def neighbors_station
    current_position = current_route_stations.find_index(@current_station)
    neighbors = []
    neighbors.push(previous_station(current_position)) unless current_position - 1 < 0
    neighbors.push(current_route_stations[current_position])
    neighbors.push(next_station(current_position)) unless current_position + 1 >= current_route_stations.length
    neighbors
  end

  def self.existing_trains
    @@trains
  end

  private

  def current_route_stations
    self.route.stations
  end

  def position_on_route
    current_route_stations.find_index(@current_station)
  end

  def train_departure(position)
    current_route_stations[position].departure_of_train(self)
  end

  def next_station(position)
    current_route_stations[position + 1]
  end

  def previous_station(position)
    current_route_stations[position - 1]
  end

  def next_station_exists?(train_position)
    train_position + 1 < current_route_stations.length
  end

  def previous_station_exists?(train_position)
    train_position - 1 >= 0
  end
end