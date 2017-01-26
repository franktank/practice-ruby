=begin
 Unscramble a string passed in
=end


# Iterate through word list, sort each word, and compare with scramble.sort -> puts them in same order if same content!

def unscramble(scramble)
    $word_list.select { |a| a.chars.sort == scramble.chars.sort }
end