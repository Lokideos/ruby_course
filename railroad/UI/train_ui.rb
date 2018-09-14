require_relative '../railroad_actions/railroad_actions_support'

class TrainUI
  TRAIN_UI_MENU_ITEMS = {
    1 => "Add new train.",
    2 => "Increase train speed.",
    3 => "Show current train speed.",
    4 => "Decrease train speed.",
    5 => "Show cars quantity.",
    6 => "Attach car.",
    7 => "Detach car.",
    8 => "Assign route.",
    9 => "Move on route.",
    10 => "Show nearby stations",
    11 => "Show all existing trains",
    12 => "Back to Railroad application main menu."
  }

  def self.show_menu
    loop do
      CommonMenuOptions.show_menu_items(TRAIN_UI_MENU_ITEMS)
      menu_choice = gets.chomp.to_i
      puts

      case menu_choice
      when 1
        TrainUIOptions.train_creation_prompt
        number = gets.chomp
        type = gets.chomp
        cars_quantity = gets.chomp.to_i
        Train.new(number, type, cars_quantity)
      when 2
        chosen_train = find_train
        #find a way to move nil check to private methods
        if chosen_train == nil
          puts
          TrainUIOptions.train_does_not_exist
          puts
          break
        end

        TrainUIOptions.speed_up_ad
        chosen_train.increase_speed
      when 3
        chosen_train = find_train
        #find a way to move nil check to private methods
        if chosen_train == nil
          puts
          TrainUIOptions.train_does_not_exist
          puts
          break
        end

        TrainUIOptions.current_speed_ad
        puts chosen_train.speed
      when 4
        chosen_train = find_train
        #find a way to move nil check to private methods
        if chosen_train == nil
          puts
          TrainUIOptions.train_does_not_exist
          puts
          break
        end

        TrainUIOptions.speed_down_ad
        chosen_train.decrease_speed
      when 5
        chosen_train = find_train
        #find a way to move nil check to private methods
        if chosen_train == nil
          puts
          TrainUIOptions.train_does_not_exist
          puts
          break
        end

        TrainUIOptions.show_cars_quantity_ad
        puts chosen_train.cars_quantity
      when 6
        chosen_train = find_train
        #find a way to move nil check to private methods
        if chosen_train == nil
          puts
          TrainUIOptions.train_does_not_exist
          puts
          break
        end

        if chosen_train.speed == 0
          TrainUIOptions.car_atttached_ad
          chosen_train.attach_car
        else
          TrainUIOptions.high_speed_warning
        end
      when 7
        chosen_train = find_train
        #find a way to move nil check to private methods
        if chosen_train == nil
          puts
          TrainUIOptions.train_does_not_exist
          puts
          break
        end

        if chosen_train.speed == 0 && chosen_train.cars_quantity > 0
          TrainUIOptions.car_detached_ad
          chosen_train.detach_car
        else
          TrainUIOptions.high_speed_warning
        end
      when 8
        chosen_train = find_train
        #find a way to move nil check to private methods
        if chosen_train == nil
          puts
          TrainUIOptions.train_does_not_exist
          puts
          break
        end

        TrainUIOptions.choose_route_prompt
        TrainUIOptions.show_routes_ad
        Route.existing_routes.each { |route| puts route.name }
        chosen_route = gets.chomp
        chosen_route = Route.existing_routes.find { |route| route.name == chosen_route }
        if chosen_route.class.to_s == "Route"
          chosen_train.assign_route(chosen_route)
          TrainUIOptions.route_assigned_ad
        else
          TrainUIOptions.route_doesn_not_exist
        end
      when 9
        chosen_train = find_train
        #find a way to move nil check to private methods
        if chosen_train == nil
          puts
          TrainUIOptions.train_does_not_exist
          puts
          break
        end

        if chosen_train.route
          TrainUIOptions.choose_direction_on_route_prompt
          direction = gets.chomp
          chosen_train.move_on_route(direction)
        else
          TrainUIOptions.route_not_assigned_ad
        end
      when 10
        chosen_train = find_train
        #find a way to move nil check to private methods
        if chosen_train == nil
          puts
          TrainUIOptions.train_does_not_exist
          puts
          break
        end

        if chosen_train.route
          TrainUIOptions.nearby_stations_ad
          chosen_train.neighbors_station.each { |station| puts station.name }
        else
          TrainUIOptions.route_not_assigned_ad
        end
      when 11
        TrainUIOptions.show_existing_trains_ad
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
    TrainUIOptions.train_number_prompt
    number = gets.chomp
    chosen_train = Train.existing_trains.find { |train| train.number == number }
  end
end