class DaysInYear
  @@months = [31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def initialize (days, months, year)
    @days = days
    @months = months
    @year = year
  end

  def number
    leap_year? ? @@months[1] = 29 : @@months[1] = 28    
    (0..@months-1).each { |month_number| @days += @@months[month_number] }    
    @days
  end

  private

  def leap_year?
    (@year % 4 == 0 && @year % 100 != 0) || @year % 400 == 0
  end
end
