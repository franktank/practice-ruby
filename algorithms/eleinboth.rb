# Two arrays, return single array with objects contained in both
# O(k + n)
a = [1,2,3,5,12,24,30,-1]
b = [2,4,5,6,7,12,30,1]

def in_both(a, b)
    hasheroo = Hash.new
    a.each do |ele|
        hasheroo[ele] = true
    end
    
    ret = []
    b.each do |e|
        if hasheroo[e]
            ret << e
        end
    end
    ret
end
p in_both(a, b)
# .uniq, or add to hash, and return keys