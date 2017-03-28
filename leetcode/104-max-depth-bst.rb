# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
# Run BFS?
def max_depth(root)
    if !root.is_a?(TreeNode) || root == nil
        return 0
    end
    h = Hash.new
    h[root] = 1
    q = Queue.new
    q.enq(root)
    while !q.empty?
        u = q.deq
        if u.left
            q.enq(u.left)
            h[u.left] = h[u] + 1
        end
        if u.right
            q.enq(u.right)
            h[u.right] = h[u] + 1
        end
    end
    h.values.max
end