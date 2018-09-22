# begin
#   puts "Before exception"
#   Math.sqrt(-1)
# rescue StandardError => e
#   puts "Error!!!"
#   raise
# rescue NoMemoryError => e
#   puts "No memory!!!"
# end

# puts "After exception"

# _____________________________________
# def method_with_error
#   #....
#   raise ArgumentError, "Oh no!"
# end

# begin
#   method_with_error
# rescue RuntimeError => e
#   puts e.inspect
# end

# puts "After exception"
# _____________________________________

# def sqrt(value)
#   sqrt = Math.sqrt(value)
#   puts sqrt
# rescue
#   puts "Wrong value"
# end

# sqrt(-1)

# _____________________________________

def connect_to_wikipedia
  #...
  raise "Connecting error"
end

attempt = 0

begin
  # connect_to_wikipedia
rescue RuntimeError
  attempt += 1
  # puts "Check your internet connection!"
  retry if attempt < 3
ensure
  puts "There were #{attempt} attempts."
end