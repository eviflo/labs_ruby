# frozen_string_literal: true

print 'Введите число x: '
x = gets.chomp.to_i
print 'Введите число y: '
y = gets.chomp.to_i
if x == 20 then print "x=#{x}"
elsif y == 20 then print "y=#{y}"
else print "Ни одно из введенных чисел не равно 20, x+y=#{x + y}"
end
