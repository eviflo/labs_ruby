# frozen_string_literal: true

# @param [Object] y
def num_word(x, y)
  if y.chars.last(2).join == 'cs'
    print "#{x**y.length}!"
  else print y.reverse.to_s
  end
end
print num_word(2, 'comics')
print num_word(10, 'abc')
