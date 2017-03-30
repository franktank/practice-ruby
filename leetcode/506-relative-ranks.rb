# @param {Integer[]} nums
# @return {String[]}
def find_relative_ranks(nums)
    sorted_nums = nums.sort
    h = Hash.new
    if sorted_nums.length - 1 >= 0
        h[sorted_nums[sorted_nums.length-1]] = "Gold Medal"
    end
    if sorted_nums.length - 2 >= 0
        h[sorted_nums[sorted_nums.length-2]] = "Silver Medal"
    end
    if sorted_nums.length - 3 >= 0
        h[sorted_nums[sorted_nums.length-3]] = "Bronze Medal"
    end
    i = 4
    while i <= sorted_nums.length
        h[sorted_nums[sorted_nums.length-i]] = i.to_s
        i += 1
    end
    ret = []
    nums.each do |e|
        ret << h[e]
    end
    ret
end