# @param {Integer[]} nums
# @return {Integer}
# Approach, think what is being done everytime
# Adding 1 to all elements except the max
def min_moves(nums)
    iters = 0
    # Add 1 to all except max everytime
    while nums.uniq.count != 1
        iters += 1
        # Find max
        a = nums.each_with_index.max[1]
        i = 0
        while i < nums.length
            if i != a
                nums[i] += 1
            end
            i += 1
        end
    end
    iters
end

# NOT OPTIMAL