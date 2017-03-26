class Node
    attr_accessor :key, :val, :next
    def initialize(k=nil, v=nil)
        @key = k
        @val = v # default is nil
        @next = nil
    end
end

class SinglyLinkedList
    include Enumerable
    attr_accessor :head
    def initialize
        @sentinel = Node.new
    end
    
    def insert(k, v)
        node_to_insert = Node.new(k, v)
        if empty?
            @sentinel.next = node_to_insert
        else
            curr_head = @sentinel.next
            @sentinel.next = node_to_insert
            node_to_insert.next = curr_head
        end
    end
    
    def empty?
        @sentinel.next == nil
    end
    
    def get(k)
        each { |node| return node.val if node.key == k }
    end
    
    def print
        each { |n| p "Key: #{n.key}, Value: #{n.val}" }
    end
    
    def remove(k)
        curr_node = @sentinel.next
        prev_node = @sentinel
        while curr_node != nil
            if k == curr_node.key
                next_node = curr_node.next
                prev_node.next = next_node
                curr_node.next = nil
                break
            else
                curr_node = curr_node.next
                prev_node = prev_node.next
            end
        end
    end
    
    def include?(k)
        any? { |node| node.key == k }
    end
    
    def each
        curr_node = @sentinel.next
        until curr_node == nil
            yield curr_node
            curr_node = curr_node.next
        end
    end
end

s = SinglyLinkedList.new
s.insert(1, "a")
s.insert(2, "b")
s.insert(3, "c")
s.insert(4, "d")
s.insert(5, "e")
s.print
p "Remove 3"
s.remove(3)
s.print
p "Remove 1"
s.remove(1)
s.print
p "Remove 5"
s.remove(5)
s.print


class HashMap
    include Enumerable
    def initialize(size = 8)
        @store = Array.new(size) {SinglyLinkedList.new}
        @num_items = 0
        @size = size
    end
    
    def insert(k, v)
        # check to see if item with key k already exists, replace if it does by deleting
        delete(k) if include?(k)
        
        # Check to see if resize is necessary
        resize! if @num_items == @size
        
        
        @num_items += 1
        index = k.hash % @size
        @store[index].insert(k, v)
    end
    
    def get(k)
        index = k.hash % @size
        @store[index].get(k)
        
    end
    
    def delete(k)
        index = k.hash % @size
        @store[index].remove(k)
    end
    
    def include?(k)
        index = k.hash % @size
        @store[index].include?(k)
    end
    
    def each
        @store.each do |list|
            list.each { |node| yield [node.key, node.val] }
        end
    end
    
    private
    
    def resize!
        old_store = @store
        @store = Array.new(@size*2) {SinglyLinkedList.new}
        @num_items = 0
        
        old_store.each do |list|
            list.each do |node|
                insert(node.key, node.val)
            end
        end
    end
end

h = HashMap.new
h.insert("a", 1)
h.insert("b", 2)
h.insert("c", 3)
h.insert("d", 4)
h.insert("e", 5)
h.insert("f", 6)
h.insert("g", 7)
h.insert("h", 8)
h.insert("i", 9)

p h.get("i")
h.delete("i")
p h.get("i")
p "true" if h.include?("a")

# consecutive_sequence - Implement a function to determine the longest consecutive sequence of 
# integers from an array of integers. For example, [1, 2, 5, 4, 3] has a sequence of 5. 
# [100, 1, 20, 4, 3, 2] has a sequence of 4 because of {1, 2, 3, 4}. 
# Notice that the integers do not appear in order. 
# Write an algorithm that will complete this task in O(nlgn) time. 
# You may assume that there can only be one sequence

# How do with hash?
arr = [100, 1, 20, 4, 3, 2]
arr.sort!
i = 0
consec = 1
while i < arr.length
    if arr[i] != arr[i+1] - 1
        break
    else
        consec += 1
    end
    i += 1
end
p consec

hs = Hash.new
hs[100] = true
hs[1] = true
hs[20] = true
hs[19] = true
hs[4] = true
hs[3] = true
hs[2] = true
hs[5] = true
hs.each do |key, val|
    if !hs[key+1] && !hs[key-1]
        hs.delete(key)
    end
end
p hs.length # Note fix so that if there are two sequences, it will take longest



