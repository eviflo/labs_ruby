# frozen_string_literal: true

# @param [Object] y
def num_word(word)
  if word.chars.last(2).join == 'cs'
    2**word.length.to_i
  else
    word.reverse.to_s
  end
end
puts "Введите ваше слово:"
word = gets.chomp.to_s
puts num_word(word)


