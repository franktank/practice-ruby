# @param {String} s
# @param {String} t
# @return {Character}
# https://leetcode.com/problems/find-the-difference/#/description
def find_the_difference(s, t)
    h = Hash.new(0)
    s.chars.each do |e|
        h[e] += 1
    end
    ret = ""
    t.chars.each do |e|
        if h[e] > 0
            h[e] -= 1
        else
            h[e] += 1
        end
    end
    h.each do |key, val|
        if val == 1
            ret = key
        end
    end
    ret
end