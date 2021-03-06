# frozen_string_literal: true

require_relative '../railroad_actions/railroad_actions_support'

class TrainUI
  TRAIN_UI_MENU_ITEMS = {
    1 => 'Add new train.',
    2 => 'Increase train speed.',
    3 => 'Show current train speed.',
    4 => 'Decrease train speed.',
    5 => 'Show attached cars.',
    6 => 'Attach car.',
    7 => 'Detach car.',
    8 => 'Assign route.',
    9 => 'Move on route.',
    10 => 'Show nearby stations',
    11 => 'Show all existing trains',
    12 => 'Back to Railroad application main menu.'
  }.freeze

  def self.show_menu
    loop do
      puts '________________________________________________'
      CommonMenuOptions.show_menu_items(TRAIN_UI_MENU_ITEMS)
      menu_choice = gets.chomp.to_i
      puts

      case menu_choice
      when 1
        puts TrainUIOptions.train_creation_prompt
        number = gets.chomp
        type = gets.chomp
        type == 'passenger' ? PassengerTrain.new(number, type) : CargoTrain.new(number, 'cargo')
      when 2
        chosen_train = find_train
        # find a way to move nil check to private methods
        unless chosen_train
          puts
          puts TrainUIOptions.train_does_not_exist
          puts
          break
        end

        puts TrainUIOptions.speed_up_ad
        chosen_train.increase_speed
      when 3
        chosen_train = find_train
        # find a way to move nil check to private methods
        unless chosen_train
          puts
          puts TrainUIOptions.train_does_not_exist
          puts
          break
        end

        print TrainUIOptions.current_speed_ad
        puts chosen_train.speed
      when 4
        chosen_train = find_train
        # find a way to move nil check to private methods
        unless chosen_train
          puts
          puts TrainUIOptions.train_does_not_exist
          puts
          break
        end

        puts TrainUIOptions.speed_down_ad
        chosen_train.decrease_speed
      when 5
        chosen_train = find_train
        # find a way to move nil check to private methods
        unless chosen_train
          puts
          puts TrainUIOptions.train_does_not_exist
          puts
          break
        end

        puts TrainUIOptions.show_attached_cars_ad
        chosen_train.cars.each { |car| puts "#{car.number}: #{car.type} car." }
      when 6
        chosen_train = find_train
        # find a way to move nil check to private methods
        unless chosen_train
          puts
          puts TrainUIOptions.train_does_not_exist
          puts
          break
        end

        puts TrainUIOptions.available_cars_list_ad
        Car.cars.each { |car| puts "#{car.number}: #{car.type} car" }
        puts
        puts TrainUIOptions.choose_car_to_operate_with_prompt
        chosen_car = gets.chomp
        chosen_car = Car.cars.find { |car| car.number == chosen_car }

        if chosen_train.can_attach_or_detach_car?(chosen_car)
          puts TrainUIOptions.car_atttached_ad
          chosen_train.attach_car(chosen_car)
        else
          puts TrainUIOptions.cars_operations_problem_ad
        end
      when 7
        chosen_train = find_train
        # find a way to move nil check to private methods
        unless chosen_train
          puts
          puts TrainUIOptions.train_does_not_exist
          puts
          break
        end

        puts TrainUIOptions.available_cars_list_ad
        chosen_train.cars.each { |car| puts car.number.to_s }
        puts
        puts TrainUIOptions.choose_car_to_operate_with_prompt
        chosen_car = gets.chomp
        chosen_car = chosen_train.cars.find { |car| car.number == chosen_car }
        if chosen_train.can_attach_or_detach_car?(chosen_car)
          puts TrainUIOptions.car_detached_ad
          chosen_train.detach_car(chosen_car)
        else
          puts TrainUIOptions.cars_operations_problem_ad
        end
      when 8
        chosen_train = find_train
        # find a way to move nil check to private methods
        unless chosen_train
          puts
          puts TrainUIOptions.train_does_not_exist
          puts
          break
        end

        puts TrainUIOptions.choose_route_prompt
        puts TrainUIOptions.show_routes_ad
        Route.existing_routes.each { |route| puts route.name }
        chosen_route = gets.chomp
        chosen_route = Route.existing_routes.find { |route| route.name == chosen_route }
        if chosen_route.class.to_s == 'Route'
          chosen_train.assign_route(chosen_route)
          puts TrainUIOptions.route_assigned_ad
        else
          puts TrainUIOptions.route_doesn_not_exist
        end
      when 9
        chosen_train = find_train
        # find a way to move nil check to private methods
        unless chosen_train
          puts
          puts TrainUIOptions.train_does_not_exist
          puts
          break
        end

        if chosen_train.route
          puts TrainUIOptions.choose_direction_on_route_prompt
          direction = gets.chomp
          chosen_train.move_forward_on_route if direction == 'forward'
          chosen_train.move_back_on_route if direction == 'back'
        else
          puts TrainUIOptions.route_not_assigned_ad
        end
      when 10
        chosen_train = find_train
        # find a way to move nil check to private methods
        unless chosen_train
          puts
          puts TrainUIOptions.train_does_not_exist
          puts
          break
        end

        if chosen_train.route
          puts TrainUIOptions.nearby_stations_ad
          chosen_train.neighbors_station.each { |station| puts station.name }
        else
          puts TrainUIOptions.route_not_assigned_ad
        end
      when 11
        puts TrainUIOptions.show_existing_trains_ad
        Train.existing_trains.each { |train| puts train.number }
        puts
      when 12
        puts
        break
      else
        CommonMenuOptions.option_does_not_exist
        puts
      end
    end
  end

  private

  def self.find_train
    puts TrainUIOptions.train_number_prompt
    number = gets.chomp
    chosen_train = Train.existing_trains.find { |train| train.number == number }
  end
end
