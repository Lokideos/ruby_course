require_relative 'test_support'
require_relative '../railroad_actions/railroad_actions_support'

class GeneralTest; end

station = Station.new("spb")
puts station
puts Station.existing_stations