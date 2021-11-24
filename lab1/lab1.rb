def greeting
  puts 'Enter your name: '
  name = gets
  puts 'Enter your surname:'
  surname = gets
  puts 'Enter your age:'
  age = gets.to_i
  age >=	18 ? "Hello, #{name} #{surname}!!! It's time to start with programming!" :
    "Hello, #{name} #{surname}!!! You are less than 18 years old, but it's never late to start with programming."
end

puts greeting

