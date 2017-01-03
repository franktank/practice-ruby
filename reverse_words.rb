def reverse_words(str)
    str = str.split(" ").reverse.join(" ")
end


message = 'find you will pain only go you recordings security the into if'

puts reverse_words(message)
# returns: 'if into the security recordings you go only pain will you find'