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