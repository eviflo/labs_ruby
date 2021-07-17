# frozen_string_literal: true

print 'Введите число покемонов:'
pokemon_num = gets.chomp.to_i
# создаем массив для покемонов
pokemons = []
pokemon_num.times do
  print 'Введите имя покемона:'
  pokemon_name = gets.chomp
  print 'Введите цвет покемона:'
  pokemon_color = gets.chomp
  pokemons.push({ name: pokemon_name, color: pokemon_color })
end
pokemons.each { |pokemons| puts pokemons }
