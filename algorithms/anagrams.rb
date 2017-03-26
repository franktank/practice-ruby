# List of words, return words that are anagrams
a = ["may", "amy", "tod", "dot", "asdf", "asdfa", "yam", "shot", "tosh", "perro", "gato", "otag"]
def ret_anagrams(list)
    sorted_words = Hash.new(0)
    list.each do |e|
        sorted_str = e.chars.sort.join
        sorted_words[sorted_str] += 1
    end
    ret_arr = []
    list.each do |e|
        word = e.chars.sort.join
        if sorted_words[word] > 1
            ret_arr << e
        end
    end
    ret_arr
end

p ret_anagrams(a)