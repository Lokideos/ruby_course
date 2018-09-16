class PassengerTrain < Train
  def initialize(number, type, cars_quantity)
    super

    @type = "passenger"
  end
end