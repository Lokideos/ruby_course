class StationUIOptions
  class << self 
    def station_name_prompt
      "Please type in name of a station."
    end

    def show_stations
      "List of stations created so far:"
    end

    def train_number_for_arriving_prompt
      "Please type in number of arriving train."
    end

    def train_number_for_departure_prompt
      "Please type in number of departuring train."
    end

    def trains_on_station_ad
      "There are several trains arrived on the station now:"
    end

    def trains_on_station_by_type_prompt
      "Now you will be given information about arrived on current station trains of specific type."
      "Please type in desired type of trains you want to check:"
    end

    def station_does_not_exist
      "Station with this name does not exist."
    end
  end
end