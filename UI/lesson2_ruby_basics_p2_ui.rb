require_relative '../homeworks/lesson2_ruby_basics_p2/lesson_2_programs'

class Lesson2UI
  LESSON_2_MENU_ITEMS = {
    1 => "30 days months.",
    2 => "Fill array with number range 10 .. 100 with step equal to 5.",
    3 => "Fill array with Fibonacсi numbers less or equal 100.",
    4 => "Make hash with keys as vowels letters and they index number as their number in alphabet.",
    5 => "Find current days number in year.",
    6 => "Shop basket",
    7 => "Back to Main Menu."
  }

  def self.show_menu
    loop do
      LESSON_2_MENU_ITEMS.each do |key, value|
        puts "#{key}: #{value}"
      end

      puts "Please choose desired option:"
      menu_choice = gets.chomp.to_i
      puts

      case menu_choice
      when 1
        puts "This program will print all months, which contain 30 days."
        puts
        puts "Those months contain only 30 days each:"
        ThirtyDaysMonths.print_30_days_months
        puts
        break
      when 2
        puts %q(This program will fill array with numbers from range 10 .. 100 
        with step equal to 5.)
        puts
        puts "Result array:"
        puts FillArrayWithDesignatedRange.iterate(5)
        puts
        break
      when 3
        puts %q(
        This program will print array with 
        Fibonacci array numbers less or equal to 100.)
        puts
        fibonacci_calculation = FillArrayWithFibonacciNumbers.new
        puts "Result array:"        
        puts fibonacci_calculation.fill_array
        puts
        break
      when 4
        puts %q(
        This program will print hash with vowels,
        where key is their number in alphabet
        and value is their actual value.
        )
        puts
        puts "Result hash:"
        puts FillHashWithVowels.fill_hash
        puts
        break
      when 5
        puts %q(
        This program will tell you number of day from the beginning of the year
        based on your input, which should be day, month and then year.
        )
        puts
        puts "Please type in day, month and year in the respective order:"
        day = gets.chomp.to_i
        month = gets.chomp.to_i
        year = gets.chomp.to_i
        if month == 0
          puts "Month can't be equal to zero."
          puts
          break
        end
        days_in_year = DaysInYear.new(day, month, year)
        puts
        puts "This day is #{days_in_year.number} from the beginning of the year."
        puts
        break
      when 6
        puts %q(
        This program will create virtual basket of goods for you
        and calculate total price of those goods.
        In this program you have to type in product name, quantity
        and then type in price for this product.
        When you decide to stop you have to type in 'stop'
        and then total price will be calculated.
        )
        puts
        basket = BasketWithGoods.new
        basket.fill_with_goods
        puts
        puts "Goods in your basket:"
        basket.show_goods
        puts
        break
      when 7
        puts
        break
      else
        puts "Such option does not exist."
        puts
      end
    end
  end
end
