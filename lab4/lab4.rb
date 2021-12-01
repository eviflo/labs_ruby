# frozen_string_literal: true
def pokemon_create
print 'Введите число покемонов:'
pokemon_num = gets.chomp.to_i
pokemons = []
pokemon_num.times do
  pokemon = {}
  puts 'Введите имя покемона:'
  pokemon[:name] = gets.chomp
  print 'Введите цвет покемона:'
  pokemon[:color] = gets.chomp
  pokemons.push(pokemon)
end
#puts pokemons.count
pokemons
end
puts pokemon_create
