# frozen_string_literal: true

module CommonMenuOptions
  def self.show_menu_items(items_list)
    items_list.each do |key, value|
      puts "#{key}: #{value}"
    end

    puts 'Please choose desired option:'
  end

  def self.option_does_not_exist
    puts 'Such option does not exist.'
    puts
  end
end
