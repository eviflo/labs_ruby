# frozen_string_literal: true

print 'Введите ваше имя: '
a = gets.chomp
print 'Введите вашу фамилию:'
b = gets.chomp
print 'Введите ваш возраст:'
c = gets.chomp.to_i
if c >=	18 then print "Привет,  #{a} #{b} !!! Самое время заняться делом!"
else print "Привет, #{a} #{b}!!! Тебе меньше 18 лет, но начать учиться программировать никогда не рано."
end
