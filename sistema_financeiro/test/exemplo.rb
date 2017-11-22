def qual_maior(a,b)
	x = a<=>b
	if x == 0
		puts 'São iguais'
	elsif x == 1
		puts  a.to_s + ' é maior'
	else
	  puts b.to_s + ' é maior'
	end
end