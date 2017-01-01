def get_middle(s)
  #your code here
  if s.length % 2 == 0
    return s[s.length/2 - 1]+s[s.length/2]
  else
    return s[s.length/2]
  end
end

# Kata.getMiddle("test") should return "es"

# Kata.getMiddle("testing") should return "t"

# Kata.getMiddle("middle") should return "dd"

# Kata.getMiddle("A") should return "A"