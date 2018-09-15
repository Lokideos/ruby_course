module RouteUIOptions
  class << self
    def show_existing_stations_ad
      "List of existing stations:"
    end

    def show_existing_routes_ad
      "List of existing routes:"
    end

    def create_route_prompt
      %q(
      Please type in names of first station of the route and last station of the route 
      in the respective order.
      )
    end

    def route_created_ad
      "Route has been succesfully created."
    end

    def wrong_station_names_ad
      "You typed in wrong station names. Please try again."
    end

    def route_name_prompt
      "Please type in desired route name."
    end

    def route_does_not_exist
      "Route with this name does not exist."
    end

    def station_add_to_route_ad
      "Station has been succesfully added to route."
    end

    def show_route_stations_ad
      "List of station existing on the route:"
    end

    def choose_station_to_delete_prompt
      "Please type in name of station you want to delete:"
    end

    def station_deleted_ad
      "Station has been succesfully deleted from the route."
    end

    def show_existing_routes_ad
      "List of existing routes:"
    end

    def add_station_to_route_prompt
      "Please type in name of the station you want to add to the route."
    end
  end
end