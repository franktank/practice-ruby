def find_short(s)
    # your code here
    n = s.split(" ")
    n = n.sort_by(&:length)
    l = n[0].length
    return l # l: length of the shortest word
end

# x Simple, given a string of words, return the length of the shortest word(s).