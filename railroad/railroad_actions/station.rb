class Station
  attr_reader :name, :trains

  @@stations = []

  def initialize (name)
    @name = name
    @trains = []
    @@stations.push(self)
  end

  def arrival_of_train(train)
    @trains.push(train)
  end

  def trains_of_type(train_type)
    @trains.select { |train| train.type == train_type }
  end

  def departure_of_train(train)
    @trains.delete(train)
  end

  def self.existing_stations
    @@stations
  end
end