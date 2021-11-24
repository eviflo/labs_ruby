# frozen_string_literal: true

def foobar
  puts 'Введите число x: '
  x = gets.to_i
  puts 'Введите число y: '
  y = gets.to_i
  if x == 20 then puts "y=#{y}"
  elsif y == 20 then puts "x=#{x}"
  else
    puts "Neither of them is 20, the sum of the numbers is #{x} + #{y} = #{x + y}"
  end
end

puts foobar
