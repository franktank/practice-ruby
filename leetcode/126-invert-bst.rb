# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
    if root
        if root.left && root.right
            t = root.left
            root.left = root.right
            root.right = t
        end
        if root.left
            root.left = invert_tree(root.left)
        end
        if root.right
            root.right = invert_tree(root.right)
        end
    else
        return TreeNode.new(nil)
    end 
    root
end

# Accepted solution
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
    return nil if root == nil
    t = root.right
    root.right = invert_tree(root.left)
    root.left = invert_tree(t)
    root
end