# frozen_string_literal: true

def greeting
  puts 'Enter your name: '
  name = gets
  puts 'Enter your surname:'
  surname = gets
  puts 'Enter your age:'
  age = gets.to_i
  if age >=	18
    "Hello, #{name} #{surname}!!! It's time to start with programming!"
  else
    "Hello, #{name} #{surname}!!! You are less than 18 years old, but it's never late to start with programming."
  end
end

puts greeting
