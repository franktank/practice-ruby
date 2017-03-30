https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/#/description
# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
    h = Hash.new
    numbers.each_with_index do |e, i|
        h[e] = i
    end
    ind1 = nil
    ind2 = nil
    
    h.each do |key, val|
        if h[target-key]
            ind1 = val
            ind2 = h[target-key]
        end
    end
    a = []
    if ind1 != ind2
        ind1 += 1
        ind2 += 1
    else
        ind1 += 1
    end
    a << ind1
    a << ind2
    a.sort
end