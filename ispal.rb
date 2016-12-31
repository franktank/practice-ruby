def is_palindrome(str)
    return str == str.reverse
end

puts "HOOPLAH" if is_palindrome("OILIO")


def palindrome?(string)
  if string.length == 1 || string.length == 0
    true
  else
    if string[0] == string[-1]
      palindrome?(string[1..-2]) # gets rid of last char and first char
    else
      false
    end
  end
end