class TrainUIOptions
  class << self
    def train_creation_prompt
      %q(
      In order to create new train
      you have to type in train's number, 
      type, which have to be 'freight' or 'passenger',
      and cars' quantity in the respective order:
      )
    end

    def show_existing_trains_ad
      "List of trains created so far:"
    end

    def train_number_prompt
      "Please type in number of a train."
    end

    def train_does_not_exist
      "Train with this number does not exist."
    end

    def speed_up_ad
      "Train's speed has been successfully increased by 10."
    end

    def speed_down_ad
      "Train's speed has been successfully decreased by 10."
    end

    def current_speed_ad
      "Train's current speed:"
    end

    def show_cars_quantity_ad
      "Train's current cars' quantity:"
    end

    def car_atttached_ad
      "Car has been successfully attached to this train."
    end

    def car_detached_ad
      "Car has been successfully detached from this train."
    end

    def high_speed_warning
      "Speed of the train is too high for this operation. Try to change it to 0."
    end

    def choose_route_prompt
      "Please type in name of route you want to assign to this train."
    end

    def show_routes_ad
      "List of existing routes:"
    end

    def route_assigned_ad
      "Route has been successfully assigned to this train."
    end

    def route_doesn_not_exist
      "Route with this name does not exists."
    end

    def route_not_assigned_ad
      "Route has not been assigned to this train."
    end

    def nearby_stations_ad
      "List of nearby stations on the route:"
    end

    def choose_direction_on_route_prompt
      "Please type in direction in which you want to move on the current route."
    end
  end
end