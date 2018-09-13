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
    trains_of_type = []
    @trains.each { |train| trains_of_type.push(train) if train.type == train_type }
    trains_of_type
  end

  def departure_of_train(train)
    @trains.delete(train)
  end
end