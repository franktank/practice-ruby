def lcp(a)
    shortest_string = a.min_by(&:length)
    prefix = ""
    shortest_string.each_char.with_index do |c, i|
        prefix = shortest_string[0..i]
        should_break = false
        a.each do |ele|
            if !ele.index(prefix)
                should_break = true
                if i == 0
                    prefix = ""
                else
                    prefix = shortest_string[0..i-1]
                end
            end
        end
        break if should_break
    end
    puts prefix + "  THIS IS PREFIX"
end

# Given array a
# As an example, longest common prefix of "abcdefgh" and "abcefgh" is "abc".
# Given the array of strings, you need to find the longest S which is the prefix of ALL the strings in the array.
a = ["abcdefgh", "abaghijk", "abcefgh"]
b = ["abcd", "abcd", "efgh"]
c = ["abaacd", "abade", "abawcf"]
lcp(a)
puts "-----------------"
lcp(b)
puts "----------------"
lcp(c)
