class Node
    attr_accessor :val, :next, :prev
    def initialize(v=nil)
        @val = v # default is nil
        @next = nil
        @prev = nil
    end
end

class LinkedList
    attr_accessor :sentinel
    include Enumerable # https://thoughtbot.com/upcase/videos/enumerable-and-comparable
    def initialize
        @sentinel = Node.new
    end
    
    def is_empty?
        @sentinel.next == nil
    end
    
    def front
        @sentinel.next
    end
    
    def back
        @sentinel.prev        
    end
    
    def include?(v)
        any? { |link| link.val == v}
    end
    
    def get(v)
        each { |link| return link if link.val == v}
        nil
    end
    
    def insert_front(v)
        insert_node = Node.new(v)
        if is_empty?
            @sentinel.next = insert_node
            @sentinel.prev = insert_node
            insert_node.next = @sentinel
            insert_node.prev = @sentinel
        else
            current_head = @sentinel.next
            @sentinel.next = insert_node
            current_head.prev = insert_node
            insert_node.prev = @sentinel
            insert_node.next = current_head
        end
    end
    
    def insert_back(v)
        node_to_insert = Node.new(v)
        if is_empty?
            @sentinel.next = node_to_insert
            @sentinel.prev = node_to_insert
            node_to_insert.next = @sentinel
            node_to_insert.prev = @sentinel
        else
            current_tail = @sentinel.prev
            @sentinel.prev = node_to_insert
            current_tail.next = node_to_insert
            node_to_insert.next = @sentinel
            node_to_insert.prev = current_tail
        end
    end
    
    def remove(v)
        each do |link|
            if link.val = v
                prev_node = link.prev
                next_node = link.next
                prev_node.next = next_node
                next_node.prev = prev_node
                link.next = nil
                link.prev = nil
            end
        end
    end
    
    def remove_front
        node_to_remove = @sentinel.next
        new_head = node_to_remove.next
        @sentinel.next = new_head
        new_head.prev = @sentinel
        node_to_remove.next, node_to_remove.prev = nil, nil
    end
    
    def remove_back
        node_to_remove = @sentinel.prev
        new_tail = node_to_remove.prev
        @sentinel.prev = new_tail
        new_tail.next = @sentinel
        node_to_remove.next, node_to_remove.prev = nil, nil
    end
    
    def print
        each do |n|
            puts n.val
        end
    end
    
    # need this for include Enumerable
    def each
        current_node = @sentinel.next
        until current_node == @sentinel
            yield current_node # use yield http://stackoverflow.com/questions/14309815/why-does-ruby-use-yield
            current_node = current_node.next
        end    
    end
end

list = LinkedList.new
list.insert_front(5)
list.insert_front(4)
list.insert_front(3)
list.insert_front(2)
list.insert_front(1)
list.insert_back(6)
list.insert_back(7)
list.print # 1 2 3 4 5 6 7
p "True" if list.include?(4) # True
n = list.get(5)
p n.val # 5
list.remove_front
list.remove_front
list.remove_front
list.remove_front
list.remove_front
list.remove_back
list.print # 6

list.insert_front(8)
list.insert_front(8)
list.insert_front(8)
list.insert_front(8)
list.insert_front(8)
list.insert_front(8)
list.insert_front(8)
list.insert_front(8)
list.insert_front(8)
list.insert_front(8)

# remove_dups - write code to remove duplicates from an unsorted linked list
# store values in hash as iterate through linked list
# one iteration O(n)
def remove_dups(list)
    values_hash = Hash.new
    current_node = list.sentinel.next
    until current_node == list.sentinel
        if values_hash[current_node.val]
            # remove current node
            prev_node = current_node.prev
            next_node = current_node.next
            next_node.prev = prev_node
            prev_node.next = next_node
            current_node.next, current_node.prev = nil
            current_node = next_node
        else
            values_hash[current_node.val] = true
            current_node = current_node.next
        end
    end
    list
end

remove_dups(list)
puts "Remove dups in list"
list.print # 8, 6

#return_kth_to_last - implement an algorithm to find the kth to last element of a singly linked list
def return_kth_to_last(list, k)
    # two pointers
    k_nodes_behind = list.sentinel.next
    curr_node = list.sentinel.next
    i = 0
    while i < k
        return nil if curr_node == nil
        curr_node = curr_node.next
        i += 1
    end
    
    while curr_node != list.sentinel
        curr_node = curr_node.next
        k_nodes_behind = k_nodes_behind.next
    end
    k_nodes_behind.val
end
list1 = LinkedList.new
list1.insert_back(1)
list1.insert_back(2)
list1.insert_back(3)
list1.insert_back(4)
list1.insert_back(5)
list1.insert_back(6)
list1.insert_back(7)

p "kth to last"
p return_kth_to_last(list1, 4)


# sum_lists - you have two numbers represented by a linked list, 
# where each node contains a single digit. 
# The digits are stored in reverse order, 
# such that 1's digit is at the head of the list. 
# Write a function that adds the two numbers and returns the sum as a linked list. 
# Example: Input: (7 -> 1 -> 6) + (5 -> 9 -> 2) = 617 + 295 = 912


def sum_lists(list1, list2)
    # Create integer number from each list
    curr1 = list1.sentinel.next
    string1 = ""
    while curr1 != list1.sentinel
        val  = curr1.val.to_s
        string1 += val
        curr1 = curr1.next
    end
    int1 = string1.reverse.to_i

    curr2 = list2.sentinel.next
    string2 = ""
    while curr2 != list2.sentinel
        val2 = curr2.val.to_s
        string2 += val2
        curr2 = curr2.next
    end
    int2 = string2.reverse.to_i
    
    int1 + int2
end

add1 = LinkedList.new
add1.insert_back(7)
add1.insert_back(1)
add1.insert_back(6)

add2 = LinkedList.new
add2.insert_back(5)
add2.insert_back(9)
add2.insert_back(2)

p "Sum lists"
p sum_lists(add1, add2)