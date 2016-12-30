# A digital root is the recursive sum of all the digits in a number. 
# Given n, take the sum of the digits of n. 
# If that value has two digits, continue reducing in this way until a single-digit number is produced. 
# This is only applicable to the natural numbers.

def digital_root(n)
  z=n.to_s.split('').map(&:to_i)    
#   z=n.to_s.split('').map { |digit| digit.to_i }
  sum = 0
  z.each do |numb|
    sum += numb
  end
  
  while (sum >= 10)
    z=n.to_s.split('').map { |digit| digit.to_i }
    z.each do |numb|
      sum += numb
    end
  end
  return sum
end