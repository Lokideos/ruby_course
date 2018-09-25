# frozen_string_literal: true

class SportCar < Car
  def start_engine
    puts 'Click!!'
    super
    puts 'Wroom!!'
  end

  protected

  def initial_rpm
    1000
  end
end
