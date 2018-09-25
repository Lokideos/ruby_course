# frozen_string_literal: true

puts "What's your name?"
name = gets.chomp

puts "When you're born?"
year = gets.chomp

puts "Hello, #{name}! You are #{2018 - year.to_i}."
