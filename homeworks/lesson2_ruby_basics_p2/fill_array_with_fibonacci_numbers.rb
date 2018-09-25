# frozen_string_literal: true

class FillArrayWithFibonacciNumbers
  FIRST_FIBONACCI_NUMBERS = [0, 1, 1].freeze

  def initialize(upper_limit = 100)
    @upper_limit = upper_limit
  end

  def fill_array
    case @upper_limit
    when 0
      [0]
    when 1
      FIRST_FIBONACCI_NUMBERS
    else
      array = FIRST_FIBONACCI_NUMBERS
      until fibonacci_incriment(array) >= @upper_limit
        array.push(fibonacci_incriment(array))
      end

      array
    end
  end

  private

  def fibonacci_incriment(array)
    array[-1] + array[-2]
  end
end
