require_relative '../homeworks/lesson1_ruby_basics/lesson_1_calculations'

class Lesson1UI
  LESSON_1_MENU_ITEMS = {
    1 => "Ideal weight.",
    2 => "Area of a triangle.",
    3 => "Right triangle.",
    4 => "Quadratic equation",
    5 => "Back to Main Menu."
  }

  def self.show_menu
    loop do
      LESSON_1_MENU_ITEMS.each do |key, value|
        puts "#{key}: #{value}"
      end

      puts "Please choose desired option:"
      menu_choice = gets.chomp.to_i
      puts

      case menu_choice
      when 1
        puts "In this program your ideal weight will be calculated"
        puts "based on your height."
        puts
        puts "Please type in your name."
        name = gets.chomp
        puts "Now please type in your height."
        height = gets.chomp.to_i

        person = IdealWeight.new(name, height)
        puts
        puts person.calculate_and_show_weight_issues
        puts
        break
      when 2
        puts "In this program triangle's area will be calculated"
        puts "based on given length of triangle's base and triangle's height to this base."
        puts
        puts "Please type in length of triangle's base:"
        a = gets.chomp.to_f
        puts "Now please type in length of triangle's height:"
        h = gets.chomp.to_f

        triangle_area = TriangleArea.new(a, h)
        puts
        puts "Area of this triangle is #{triangle_area.calculate_area}"
        puts
        break
      when 3
        puts "In this program triangle's type will be shown"
        puts "if this triangle is right."
        puts "It will require you to type in length of this triangle's sides."
        puts
        puts "Please type in length of first triangle's side:"
        a = gets.chomp.to_f
        puts "Please type in length of second triangle's side:"
        b = gets.chomp.to_f
        puts "Please type in length of third triangle's side:"
        c = gets.chomp.to_f
        puts

        triangle = RightTriangle.new(a, b, c)
        triangle.name_right_triangle_sides
        if triangle.is_right?
          print "Your triangle is right" 
          print " and isosceles" if triangle.is_isosceles?
          print " and also equilateral" if triangle.is_equilateral?
          puts "."
          puts
        else
          puts "Your triangle isn't right."
        end
        break
      when 4
        puts "This program will calculate roots and discriminant of quadratic equation"
        puts "based on given coefficients' values."
        puts
        puts "Please type in value of first coefficient:"
        a = gets.chomp.to_f
        puts "Please type in value of second coefficient:"
        b = gets.chomp.to_f
        puts "Please type in value of third coefficient:"
        c = gets.chomp.to_f
        
        equation = QuadraticEquation.new(a, b, c)
        equation.calculate_discriminant
        roots = equation.calculate_roots
        puts
        if roots.class.to_s == "Array"
          print "There are 2 roots for this equation:"
          roots.each { |root| print " #{root}" }
          puts "."
        else
          puts roots == nil ? "There are no roots in this equation." : "#{roots} is root for this equation."
        end
        puts
        break
      when 5
        puts
        break
      else
        puts "Such option does not exist."
        puts
      end
    end
  end
end