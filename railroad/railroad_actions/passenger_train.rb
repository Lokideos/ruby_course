# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(number, type)
    super

    @type = 'passenger'
  end
end
