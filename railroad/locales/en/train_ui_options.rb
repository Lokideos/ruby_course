class TrainUIOptions
  def self.train_creation_prompt
    puts %q(
    In order to create new train
    you have to type in train's number, 
    type, which have to be 'freight' or 'passenger',
    and cars' quantity in the respective order:
    )
  end

  def self.show_existing_trains_ad
    puts "List of trains created so far:"
  end

  def self.train_number_prompt
    puts "Please type in number of a train."
  end

  def self.train_does_not_exist
    puts "Train with this number does not exist."
  end

  def self.speed_up_ad
    puts "Train's speed has been successfully increased by 10."
  end

  def self.speed_down_ad
    puts "Train's speed has been successfully decreased by 10."
  end

  def self.current_speed_ad
    print "Train's current speed:"
  end

  def self.show_cars_quantity_ad
    puts "Train's current cars' quantity:"
  end

  def self.car_atttached_ad
    puts "Car has been successfully attached to this train."
  end

  def self.car_detached_ad
    puts "Car has been successfully detached from this train."
  end

  def self.high_speed_warning
    puts "Speed of the train is too high for this operation. Try to change it to 0."
  end

  def self.choose_route_prompt
    puts "Please type in name of route you want to assign to this train."
  end

  def self.show_routes_ad
    puts "List of existing routes:"
  end

  def self.route_assigned_ad
    puts "Route has been successfully assigned to this train."
  end

  def self.route_doesn_not_exist
    puts "Route with this name does not exists."
  end

  def self.route_not_assigned_ad
    puts "Route has not been assigned to this train."
  end

  def self.nearby_stations_ad
    puts "List of nearby stations on the route:"
  end
end