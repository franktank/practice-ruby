class BSTNode
    attr_accessor :key, :value, :left, :right, :size
    def initialize(k = nil, v = nil, s = 1)
        @key = k
        @value = v
        @size = s
        @left = nil
        @right = nil
    end
end
class BST
    attr_accessor :root
    def initialize
        @root = nil
    end
    
    def insert(k, v)
        if @root
            @root = BST.insert_helper!(@root, k, v)
        else
            @root = BSTNode.new(k, v, 1)
        end
    end
    
    def delete(k)
        if k
            root = BST.delete_helper!(@root, k)
        end
    end
    
    def get(k)
        if k
            BST.get_helper!(@root, k)
        end
    end
    
    def inorder
        BST.inorder!(@root)
    end
    
    private
    def self.delete_min!(x)
        return x.right if x.left == nil
        x.left = delete_min!(x.left)
        x.size = size(x.left) + size(x.right) + 1
    end
    
    def self.min!(x)
        return x if x.left == nil
        min(x.left)
    end
        
        
    def self.inorder!(x)
        if x == nil
           return 
        end
        
        inorder!(x.left)
        puts "Key: #{x.key}, Value: #{x.value}"
        inorder!(x.right)
    end
    
    def self.get_helper!(x, k)
        if x == nil
            nil
        elsif k > x.key
            get_helper!(x.right, k)
        elsif k < x.key
            get_helper!(x.left, k)
        else
            x.value
        end
    end
    
    def self.delete_helper!(x, k)
        if x == nil
            nil
        elsif k < x.key
            x.left = delete_helper!(x.left, k)
        elsif k > x.key
            x.right = delete_helper!(x.right, k)
        else
            # Handles case of one children or no children
            return x.left if x.right == nil
            return x.right if x.left == nil
            
            # Handle case 3 of two children
            # Find successor of x called succ, which should be in right subtree
            # succ replaces x in tree, delete succ from tree and replace x
            # x right subtree becomes succ right subtree
            # x left subtree becomes succ left subtree
            # if succ is x right child, then replace x with succ and leave succ right child
            # if succ is not x right child but in right subtree
                # replace succ with its own right child
            temp = x
            x = min!(temp.right)
            x.left = temp.left # does order matter?
            x.right = delete_min!(temp)
        end
        x = size!(x.left) + size!(x.right) + 1
        x
    end
    
    def self.size!(x)
        if x == nil
            0
        else
            x.size
        end
    end
    
    def self.insert_helper!(x, k, v)
        if x == nil
            return BSTNode.new(k, v, 1)
        elsif k < x.key
            x.left = insert_helper!(x.left, k, v)
        elsif k > x.key
            x.right = insert_helper!(x.right, k, v)
        else
            x.value = v
        end
        x.size = size!(x.left) + size!(x.right) + 1
        x
    end
end

b = BST.new
b.insert(5, "c")
b.insert(4, "b")
b.insert(6, "d")
b.insert(3, "a")
b.insert(7, "e")
b.inorder
p b.get(3)
b.delete(6)
b.inorder


def mirrored?(left, right)
    return (left == nil && right == nil) if right == nil || left == nil
    left.value == right.value && mirrored?(left.left, right.right) && mirrored(left.right, right.left)
end

a = [5,7,12,15,18,20]
# Nondecreasing array to balanced BST
def arrtobst(a, bst)
    if a.length == 1
        p a[0]
        bst.insert(a[0], "temp")
    elsif a.length > 1
        mid_idx = a.length/2
        p a[mid_idx]
        bst.insert(a[mid_idx], "temp")
        arrtobst(a.take(mid_idx), bst)
        arrtobst(a.drop(mid_idx + 1), bst)
    end
end
a2 = [1,2,3,4,5]
p "Array to BST"
bstree = BST.new
arrtobst(a, bstree)
bstree.inorder
btt = BST.new
btt = arrtobst(a2, btt)
btt.inorder