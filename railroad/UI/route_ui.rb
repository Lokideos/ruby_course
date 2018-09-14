require_relative '../railroad_actions/railroad_actions_support'

class RouteUI
  ROUTE_UI_MENU_ITEMS = {
    1 => "Add new route.",
    2 => "Add station to route.",
    3 => "Delete station from route.",
    4 => "Show stations on route.",
    5 => "Show all existing routes.",
    6 => "Back to Railroad application main menu."
  }

  def self.show_menu
    loop do
      CommonMenuOptions.show_menu_items(ROUTE_UI_MENU_ITEMS)
      menu_choice = gets.chomp.to_i
      puts

      case menu_choice
      when 1
        RouteUIOptions.show_existing_stations_ad
        RouteUI.show_existing_stations
        RouteUIOptions.create_route_prompt
        first_station = gets.chomp
        second_station = gets.chomp
        first_station = Station.existing_stations.find { |station| station.name == first_station }
        second_station = Station.existing_stations.find { |station| station.name == second_station }
        if first_station.class.to_s == "Station" && second_station.class.to_s == "Station"
          Route.new(first_station, second_station)
          RouteUIOptions.route_created_ad
        else
          RouteUIOptions.wrong_station_names_ad
        end
      when 2
        chosen_route = find_route

        #find a way to move nil check to private methods
        unless chosen_route
          puts
          RouteUIOptions.route_does_not_exist
          puts
          break
        end

        RouteUIOptions.show_existing_stations_ad
        RouteUI.show_existing_stations
        RouteUIOptions.add_station_to_route_prompt
        chosen_station = gets.chomp
        chosen_station = Station.existing_stations.find { |station| station.name == chosen_station }
        if chosen_station.class.to_s == "Station"
          RouteUIOptions.station_add_to_route_ad
          chosen_route.add_station(chosen_station)
        else
          RouteUIOptions.wrong_station_names_ad
        end
      when 3
        chosen_route = find_route

        #find a way to move nil check to private methods
        unless chosen_route
          puts
          RouteUIOptions.route_does_not_exist
          puts
          break
        end

        RouteUI.show_stations_on_route(chosen_route)
        RouteUIOptions.choose_station_to_delete_prompt
        chosen_station = gets.chomp
        chosen_station = chosen_route.stations.find { |station| station.name == chosen_station }
        if chosen_station.class.to_s == "Station" 
          RouteUIOptions.station_deleted_ad
          chosen_route.stations.each { |station| chosen_route.remove_station(chosen_station) }
        else
          RouteUIOptions.wrong_station_names_ad
        end
      when 4
        chosen_route = find_route

        #find a way to move nil check to private methods
        unless chosen_route
          puts
          RouteUIOptions.route_does_not_exist
          puts
          break
        end

        RouteUI.show_stations_on_route(chosen_route)
      when 5
        RouteUIOptions.show_existing_routes_ad
        Route.existing_routes.each { |route| puts route.name }
        puts
      when 6
        puts
        break
      else
        CommonMenuOptions.option_does_not_exist
        puts
      end
    end
  end

  private

  def self.show_existing_stations
    Station.existing_stations.each { |station| puts station.name }
  end

  def self.show_stations_on_route(chosen_route)
    RouteUIOptions.show_route_stations_ad
    chosen_route.stations.each { |station| puts station.name }
  end

  def self.find_route
    RouteUIOptions.route_name_prompt
    name = gets.chomp
    chosen_route = Route.existing_routes.find { |route| route.name == name }
  end
end