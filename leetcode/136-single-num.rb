# https://leetcode.com/problems/single-number/#/description
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
    h = Hash.new(0)
    nums.each do |e|
        h[e] += 1
    end
    
    nums.each do |e|
        if h[e] != 2
            return e
        end
    end
end