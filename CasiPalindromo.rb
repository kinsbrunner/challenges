def IsCasiPalindromo (palabra)
  longitud = palabra.size
  mitad = (longitud / 2).floor
  palabra_1 = palabra[0..mitad-1]
  palabra_2 = longitud % 2 == 0 ? palabra[mitad..longitud-1].reverse : palabra[mitad+1..longitud-1].reverse
  return true if palabra_1 == palabra_2

  coincidencias = 0
  palabra_1.split("").each_with_index do |car, i|
      coincidencias += 1 if car == palabra_2[i]
  end
  return palabra_1.size - coincidencias == 1
end

puts IsCasiPalindromo ('abccba')
puts IsCasiPalindromo ('abccbx')
puts IsCasiPalindromo ('abccxx')
puts IsCasiPalindromo ('menem')
puts IsCasiPalindromo ('menemriojano')

