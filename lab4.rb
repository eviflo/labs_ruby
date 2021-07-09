print "Введите число покемонов:"
@pokemon_num=gets.chomp.to_i
@pokemon_num.times {

print "Введите имя покемона:"
@pokemon_name=gets.chomp
print "Введите цвет покемона:"
@pokemon_color=gets.chomp

pokemons= {:name =>  @pokemon_name, :color => @pokemon_color}
pokemons.each do |key, value|
  puts pokemons
end
}
