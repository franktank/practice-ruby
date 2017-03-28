# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
    h = Hash.new(0)
    nums1.each do |e|
        h[e] += 1
    end
    ret = []
    nums2.each do |e|
        if h[e] > 0
            ret << e
            h[e] -= 1
        end
    end
    ret
end