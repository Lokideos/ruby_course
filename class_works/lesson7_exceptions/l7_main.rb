# frozen_string_literal: true

def connect_to_wikipedia
  # ...
  raise 'Connecting error'
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
end
