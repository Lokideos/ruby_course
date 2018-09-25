# frozen_string_literal: true

class Car
  attr_reader :number, :type

  @@cars = []

  def initialize(number, type)
    @number = number
    @type = type == 'passenger' ? type : 'cargo'
    @@cars << self
  end

  def self.cars
    @@cars
  end
end
