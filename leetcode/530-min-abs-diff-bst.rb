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
def get_minimum_difference(root)
    # Approach:
    # Inorder traversal, while tracking previous root value and min difference
    s = Solution.new
    s.inorder(root)
end

class Solution
    def initialize
        @min = 999999999999999999
        @prev = nil
    end
    def inorder(root)
        if root == nil
            return @min
        end
        inorder(root.left)
        
        if @prev
            @min = [@min, root.val - @prev].min
        end
        @prev = root.val
        inorder(root.right)
        
        @min
    end
end