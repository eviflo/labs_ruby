# frozen_string_literal: true

@start_balance = 100
if @balance = File.exist?('./data/balance.txt')
  @file = File.open('./data/balance.txt', 'r')
  puts @balance = File.read('./data/balance.txt').to_i
  puts @balance.inspect

else

  puts @balance == @start_balance
end

def operations
  print "Какие операции вы хотите осуществить с вашим счетом (D - внести деньги на депозит, W-вывести деньги, \n
B -Вывести баланс на экран, Q - завершить работу и сохранить текущие данные)"
  @operation = gets.chomp.to_s
  case @operation
  when 'd', 'D' then deposit_plus
  when 'w', 'W' then deposit_withdraw
  when 'b', 'B'   then balance_output
  when 'q', 'Q'   then quit_program
  else abort "Ошибка операции, введите правильный символ : D - внести деньги на депозит, W-вывести деньги,\n
B - Вывести баланс на экран, Q - завершить работу и сохранить текущие данные"
  end
end

def deposit_plus
  print 'Введите сумму, которую вы хотите внести на депозит '
  @deposit_sum = gets.chomp.to_i
  if @deposit_sum >= 0
    puts @balance + @deposit_sum
    print "Сумма текущего баланса #{@balance} + #{@deposit_sum} =#{@balance + @deposit_sum} \n"
    File.open('./data/balance.txt', 'w+') do |file|
      file.write((@balance + @deposit_sum).to_s)
      print "Данные записаны\n"
      file.close
    end

  else print 'Вы ввели некорректное значение, перезапустите программу '
  end
  operations
end

def deposit_withdraw
  print "Введите сумму, которую вы хотите снять с текущего счета #{@balance.inspect} \n"
  @withdraw_sum = gets.chomp.to_i
  if @withdraw_sum <= @balance
    @balance - @withdraw_sum
    print "Сумма текущего баланса #{@balance} - #{@withdraw_sum} =#{@balance - @withdraw_sum}\n"
    File.open('./data/balance.txt', 'w+') do |file|
      file.write((@balance - @withdraw_sum).to_s)
      print "Данные записаны \n"
      file.close
    end
  else print 'Вы ввели некорректное значение, перезапустите программу'

  end
  operations
end

def balance_output
  puts "Баланс вашего лицевого счета #{@balance}"
  operations
end

def quit_program
  abort "Выполнение программы завершено, баланс записан\n"
end

operations
