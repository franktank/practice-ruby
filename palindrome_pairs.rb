https://leetcode.com/submissions/detail/90678396/

# @param {String[]} words
# @return {Integer[][]}
def palindrome_pairs(words)
    # N^2 solution? see if any word is reverse of another word, track index
    pal_ind = Hash.new
    for i in 0..words.length-1 do
        for j in 0..words.length-1 do
            unless i == j
                build_str = words[i] + words[j]
                if build_str == build_str.reverse
                    puts build_str
                    puts i
                    puts j
                    puts "-----------------"
                    pal_ind[build_str + i.to_s] = [i, j]
                end
                
                
            end
        end
    end
    pal_ind.values
end