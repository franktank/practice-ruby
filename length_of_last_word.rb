def lengthOfLastWord(a)
    a = a.split(" ")
    a.last.length
end

str = "the cat dog lololol"
puts lengthOfLastWord(str)