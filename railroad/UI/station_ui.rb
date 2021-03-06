# frozen_string_literal: true

require_relative '../railroad_actions/railroad_actions_support'

class StationUI
  STATION_UI_MENU_ITEMS = {
    1 => 'Add new station.',
    2 => 'Assign train to station.',
    3 => 'Delete train from station.',
    4 => 'Show trains on station.',
    5 => 'Show trains on station by type.',
    6 => 'Show existing stations.',
    7 => 'Back to Railroad application main menu.'
  }.freeze

  def self.show_menu
    loop do
      puts '________________________________________________'
      CommonMenuOptions.show_menu_items(STATION_UI_MENU_ITEMS)
      menu_choice = gets.chomp.to_i
      puts

      case menu_choice
      when 1
        puts StationUIOptions.station_name_prompt
        name = gets.chomp
        Station.new(name)
      when 2
        chosen_station = find_station

        # find a way to move nil check to private methods
        unless chosen_station
          puts
          puts StationUIOptions.station_does_not_exist
          puts
          break
        end

        puts StationUIOptions.train_number_for_arriving_prompt
        number = gets.chomp
        chosen_train = Train.existing_trains.find { |train| train.number == number }
        chosen_station.arrival_of_train(chosen_train)
      when 3
        chosen_station = find_station

        # find a way to move nil check to private methods
        unless chosen_station
          puts
          puts StationUIOptions.station_does_not_exist
          puts
          break
        end

        puts StationUIOptions.train_number_for_departure_prompt
        number = gets.chomp
        chosen_train = chosen_station.trains.find { |train| train.number == number }
        chosen_station.departure_of_train(chosen_train) if chosen_train
      when 4
        chosen_station = find_station

        # find a way to move nil check to private methods
        unless chosen_station
          puts
          puts StationUIOptions.station_does_not_exist
          puts
          break
        end

        puts StationUIOptions.trains_on_station_ad
        chosen_station.trains.each { |train| puts train.number }
      when 5
        chosen_station = find_station

        # find a way to move nil check to private methods
        unless chosen_station
          puts
          puts StationUIOptions.station_does_not_exist
          puts
          break
        end

        puts StationUIOptions.trains_on_station_by_type_prompt
        chosen_type = gets.chomp
        chosen_station.trains.each { |train| puts train.number if train.type == chosen_type }
      when 6
        puts StationUIOptions.show_stations
        Station.existing_stations.each { |station| puts station.name }
        puts
      when 7
        puts
        break
      else
        CommonMenuOptions.option_does_not_exist
        puts
      end
    end
  end

  private

  def self.find_station
    puts StationUIOptions.station_name_prompt
    name = gets.chomp
    chosen_station = Station.existing_stations.find { |station| station.name == name }
  end
end
