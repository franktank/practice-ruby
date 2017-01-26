# @param {String} s
# @return {String}

# https://leetcode.com/problems/reverse-vowels-of-a-string/
#hello
#holle
def reverse_vowels(s)
    vow_loc = Hash.new
    vowels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
    s.length.times do |x|
        if vowels.index(s[x])
            vow_loc[x] = s[x] # Find all locations of vowels
            puts x
        end
    end
    p vow_loc
    
    # I have location of all the vowels
    # I need to shift all the vowels over to the next index
    
    # a = [ "a", "b", "c", "d" ]
    # a.rotate         #=> ["b", "c", "d", "a"]
    # a                #=> ["a", "b", "c", "d"]
    puts s
    rot_vals = vow_loc.values.rotate
    vow_loc.each_with_index do |kv, i|
        s[kv[0]] = rot_vals[i]
    end
    s
end