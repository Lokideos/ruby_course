module FuelTank
  def fill_tank(level)
    self.fuel_tank = level
  end

  def fuel_level
    self.fuel_tank
  end

  protected
  attr_accessor :fuel_tank
end

module Debugger
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def debug(log)
      puts "!!!DEBUG: #{log}!!!!"
    end
  end

  module InstanceMethods
    def debug(log)
      self.class.debug(log)
    end

    def print_class
      print self.class
    end
  end
end

class Car
  include FuelTank
  include Debugger

  NUMBER_FORMAT = /^[а-я]{1}\d{3}[а-я]{2}$/i

  attr_reader :current_rpm
  attr_accessor :number

  @@instances = 0

  def self.instances
    @@instances
  end

  debug 'Start interface'

  def initialize(number)
    @number = number
    @current_rpm = 0
    @@instances += 1
    debug 'initialize'
    validate!
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    current_rpm.zero?
  end

  def valid?
    validate!
  rescue
    false
  end

  debug 'End interface'

  protected

  attr_writer :current_rpm
  attr_accessor :fuel_tank

  def validate!
    raise "Number can't be nil!" if number.nil?
    raise "Number should be at least 6 symbols" if number.length < 6
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
    true
  end

  def initial_rpm
    700
  end

  def start_engine!
    self.current_rpm = initial_rpm
  end
end


class MotorBike
  include FuelTank
  include Debugger

  debug 'MotorBike class'
end