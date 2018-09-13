require_relative '../support/icons'
require_relative 'lesson1_ruby_basics_ui'
require_relative 'lesson2_ruby_basics_p2_ui'

MAIN_MENU_ITEMS = {
  1 => "Ruby Lesson 1: Ruby Basics.",
  2 => "Ruby Lesson 2: Ruby Basics, part 2.",
  3 => "Exit the program."
}

puts RubyCourseIcons.menu_greeting_icon
puts "Welcome to ruby courses learning project!"
puts "This experience is delivered to you by Thinknetica glorious team and Robotech Inc."
puts "Please enjoy your stay."
puts

loop do
  MAIN_MENU_ITEMS.each do |key, value|
    puts "#{key}: #{value}"
  end

  puts "Please choose desired option:"
  menu_choice = gets.chomp.to_i

  case menu_choice
  when 1
    puts
    Lesson1UI.show_menu
  when 2
    puts
    Lesson2UI.show_menu
  when 3
    puts
    break
  else
    puts "Such option does not exist."
    puts
  end
end

puts "Please press any key to exit the program..."
gets
