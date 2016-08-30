def distance(x1, y1, x2, y2)
  Math.sqrt((x1-x2)**2 + (y1-y2)**2);
end

d1 = distance(3, 3, 1, 1)
d2 = distance(3, 3, 2, 2)
d3 = distance(2, 2, 1, 1)

puts (d1+d2+d3)/3