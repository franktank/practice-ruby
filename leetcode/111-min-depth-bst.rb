# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# https://leetcode.com/problems/minimum-depth-of-binary-tree/#/description

# @param {TreeNode} root
# @return {Integer}
def min_depth(root)
    # BFS and keep track of min depth and distances
    if root == nil
        return 0
    end
    min_depth = 99999999999999999
    @distance = Hash.new(0)
    q = Queue.new
    q.enq(root)
    @distance[root] = 1
    while !q.empty?
        u = q.deq
        if u.left == nil && u.right == nil
            min_depth = [min_depth, @distance[u]].min
        end
        if u.left
            @distance[u.left] = @distance[u] + 1
            q.enq(u.left)
        end
        if u.right
            @distance[u.right] = @distance[u] + 1
            q.enq(u.right)
        end
    end
    min_depth
end