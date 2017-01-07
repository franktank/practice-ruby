ROMAN_NUMS = { 0 => "", 1 => "I", 2 => "II", 3 => "III", 
               4 => "IV", 5 => "V", 6 => "VI", 7 => "VII", 
               8 => "VIII", 9 => "IX", 10 => "X", 20 => "XX",
               30 => "XXX", 40 => "XL", 50 => "L", 60 => "LX", 
               70 => "LXX", 80 => "LXXX", 90 => "XC", 100 => "C",
               200 => "CC", 300 => "CCC", 400 => "CD", 500 => "D",
               600 => "DC", 700 => "DCC", 800 => "DCCC", 900 => "CM",
               1000 => "M", 2000 => "MM", 3000 => "MMM" }

def int_to_roman(int_num)
    roman_string = ""
    ten_power = 0
    current_num = 0
    while int_num > 0
        current_num = int_num % 10
        current_num *= 10**ten_power
        current_roman = ROMAN_NUMS[current_num]
        roman_string.prepend(current_roman)
        ten_power += 1
        int_num /= 10
        current_num = 0
    end
    roman_string
end

# 14 -> XIV
# 5 -> V


# build IV, then build X
puts int_to_roman(100) # C
puts int_to_roman(14) # IV
puts int_to_roman(2014) # MCMLIV
puts int_to_roman(1990) # MCMXC
puts int_to_roman(1954) # MCMLIV