class Route
  attr_reader :name, :stations

  def initialize(first_station, last_station)
    @stations=[first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station) unless station == @station[0] || station == @station[-1]
  end
end