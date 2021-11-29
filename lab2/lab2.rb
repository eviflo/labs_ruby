# frozen_string_literal: true

def foobar(x, y)
  if x == 20
    y
  elsif y == 20
    x
  else
    x + y
  end
end
puts 'Введите число x: '
x = gets.to_i
puts 'Введите число y: '
y = gets.to_i
puts foobar(x, y)
