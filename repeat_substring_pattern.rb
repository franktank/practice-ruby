=begin
Input: "abab"

Output: True

Explanation: It's the substring "ab" twice.
=end

=begin
Input: "aba"

Output: False
=end

=begin
Input: "abcabcabcabc"

Output: True

Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)
=end

def repeated_substring_pattern(str)
    # N^2 solution
    substr_pattern = ""
    str.length.times do |x|
        split_on_this = str[0..x]
        arr = str.split(split_on_this)
        if arr.all? {|x| x == arr[0]} && split_on_this != str
            substr_pattern = split_on_this
        end
    end
    substr_pattern != "" ? "TRUE" : "FALSE"
end

puts repeated_substring_pattern("abcabc")

p "-------------------"

p repeated_substring_pattern("ABCAAA")

p repeated_substring_pattern("ABA")

p repeated_substring_pattern("ABAB")


# git reset HEAD^ is kinda cool :)