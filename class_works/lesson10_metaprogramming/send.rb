puts "Enter string"
str = gets.chomp
puts "Etner method"
method = gets.chomp.to_sym
puts str.send(method)