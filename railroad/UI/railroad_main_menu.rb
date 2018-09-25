# frozen_string_literal: true

require_relative 'train_ui'
require_relative 'station_ui'
require_relative 'route_ui'
require_relative 'car_ui'
require_relative '../locales/en'

class RailroadUI
  RAILROAD_MAIN_MENU_ITEMS = {
    1 => 'Manage trains',
    2 => 'Manage stations',
    3 => 'Manage routes',
    4 => 'Manage cars.',
    5 => 'Back to main menu.'
  }.freeze

  def self.show_menu
    loop do
      CommonMenuOptions.show_menu_items(RAILROAD_MAIN_MENU_ITEMS)
      menu_choice = gets.chomp.to_i
      puts

      case menu_choice
      when 1
        puts
        TrainUI.show_menu
      when 2
        puts
        StationUI.show_menu
      when 3
        puts
        RouteUI.show_menu
      when 4
        puts
        CarUI.show_menu
      when 5
        puts
        break
      else
        CommonMenuOptions.option_does_not_exist
        puts
      end
    end
  end
end
