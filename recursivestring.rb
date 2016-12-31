def rev_string(str)
    if str.length > 1
        rev_string(str[1..str.length]) + str[0]
    else
        str
    end
end

puts rev_string("billabong")
puts rev_string("lmao")

str = "abcdefg"
puts str[1..-2] # 1 skips char at 0, and then -2 removes the last char of the string