def num_word(x,y)
	if y.chars.last(2).join == "cs" then
	print "#{x**y.length}!"
else print "#{y.reverse}"
end
end
print num_word(2, "comics")
print num_word(10, "abc")