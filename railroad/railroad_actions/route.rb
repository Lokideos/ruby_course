class Route
  attr_reader :name, :stations

  @@routes = []

  def initialize(first_station, last_station)
    @stations=[first_station, last_station]
    @name = "#{first_station} - #{last_station}"
    @@routes << self
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station) unless station == @station[0] || station == @station[-1]
  end

  def self.existing_routes
    @@routes
  end
end