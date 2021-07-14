def results_reading
File.open("data/results.txt", "r") do |f|
puts @results = f.readlines()
end
  end

file = File.open("./data/students.txt")
file_data = File.read("./data/students.txt").split("\n")
@all_students_count = file_data.length
puts @all_students_count.inspect
print "Введите возраст предполагаемой группы студентов:"
@students_age = gets.chomp.to_i
File.open("./data/students.txt") do |f|
 puts @lines = f.find_all {|line|line =~/#{@students_age}/}
 @proper_students = @lines.length
 puts @proper_students.inspect
   end


print "Повторите ввод для записи результатов в файл:"
@students_age2 = gets.chomp.to_i
if @students_age ==@students_age2 && @students_age2 !=-1 then
File.open("./data/results.txt", "a+") do |file| 
file.write("#{@lines}") 
print "Данные записаны"
file.close()
end
else print "Все плохо,перезапустите программу"
end

if @proper_students ==@all_students_count || @students_age2 ==-1 then
results_reading
else print "Не все студенты попали на курс"
end


