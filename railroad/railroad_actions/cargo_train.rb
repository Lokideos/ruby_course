class CargoTrain < Train
  def initialize(number, type, cars_quantity)
    super

    @type = "cargo"
  end
end