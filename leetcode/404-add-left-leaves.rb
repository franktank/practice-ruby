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
# Problem apporach -> determine characteristics of a left leaf
def sum_of_left_leaves(root)
    if !root
        return 0
    end
    #BFS with conditional
    q = Queue.new
    sum = 0
    q.enq(root)
    while !q.empty?
        u = q.deq
        # Check to see left leaf
        if u.left != nil &&
             u.left.left == nil &&
               u.left.right == nil
            sum += u.left.val
        end
        if u.left
            q.enq(u.left)
        end
        if u.right
            q.enq(u.right)
        end
    end
    sum
end