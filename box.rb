def box(n)
  (1..n).map do |num| 
  if num == 1 || num == n
    "-" * n   # Top and bottom of box
  else 
    "-#{" " * (n -2)}-" # Sides
  end
  end
end