require_relative '../railroad_actions/railroad_actions_support'

class CarUI
  CAR_UI_MENU_ITEMS = {
    1 => "Add car",
    2 => "Back to Railroad application main menu."
  }

  def self.show_menu
    loop do
      puts "________________________________________________"
      CommonMenuOptions.show_menu_items(CAR_UI_MENU_ITEMS)
      menu_choice = gets.chomp.to_i
      puts

      case menu_choice
      when 1
        puts CarUIOptions.add_car_prompt
        number = gets.chomp
        type = gets.chomp
        type = "passenger" ? PassengerCar.new(number, type) : CargoCar.new(number, type)      
      when 2
        puts
        break
      else
        CommonMenuOptions.option_does_not_exist
        puts
      end
    end
  end
end