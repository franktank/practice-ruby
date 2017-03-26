# http://www.rubydoc.info/stdlib/core/Array

# Use array operations
# Add to back: push / << 
# Add to front: unshift()
# Add to any index: insert(index, val, val, val)
# Remove from end: pop
# Remove from front: shift
# Delete at index: delete_at(index)
# Delete any value: delete(value)
# .compact / .compact!
# NOTE: ! is destructive and without bang is non-destructive
# .uniq / .uniq!


# Iterating
# .each { |a| print a -= 10, " " }
# .reverse_each

# .map / .map!
# arr.map { |a| 2*a }   #=> [2, 4, 6, 8, 10]
# arr                   #=> [1, 2, 3, 4, 5]
# arr.map! { |a| a**2 } #=> [1, 4, 9, 16, 25]
# arr                   #=> [1, 4, 9, 16, 25]

# .select
# .reject
# .map_with_index, .each_with_index

class Stack
    def initialize
        @store = []
    end
    
    def empty?
        @store.empty?    
    end
    
    def last
        @store.last
    end
    
    def pop
        @store.pop
    end
    
    def push(v)
        @store << v
        # @store.push(v)
    end
end

class Queue
    def initialize
        @store = Array.new
    end
    
    def enqueue(v)
        @store.push(v)
        # or @store << v
    end
    
    def dequeue
        @store.shift
    end
end

# Stack Min - How would you design a stack which, 
# in addition to push and pop,
# has a function min which returns the minimum element? 
# Write a class for it

class StackMin
    def initialize
        @store = []
        @min = nil
    end
    
    def push(v)
        @store << v
        if @min
            @min = [@min, v].min
        else
            @min = v
        end
    end
    
    def pop
        @store.pop
    end
    
    def last
        @store.last
    end
    def min
        @min
    end
end

s = StackMin.new
s.push(5)
s.push(3)
s.push(12)
s.push(10)
s.push(8)
p s.min

# Stack of Plates: Imagine a stack of plates. 
# If the stack gets too high, it might topple. 
# Therefore, in real life, we would likely start a new stack when the previous stack 
# exceeds some threshold. 
# Implement a data structure SetOfStacks that mimics this. 
# SetOfStacks should be composed of several stacks 
# and should create a new stack once the previous one exceeds capacity. 
# SetOfStacks.push() and SetOfStacks.pop() should behave identically to a single stack. 
# Follow-up: Implement a function popAt(idx) which performs a pop operation on a specific sub-stack.

class SetOfStacks
    def initialize(c = 10)
        @store = []
        @cap = c
    end
    
    # Array of stacks
    def push(v)
        if @store.empty? || @store.last.length == @cap
            @store << [v]
        else
            @store.last << v
        end
    end
    
    def pop
        raise "index out of bound" if @store.empty?
        if @store.last.empty?
            @store.pop
            @store.last.pop
        else
            @store.last.pop
        end
    end
    
    def popAt(idx)
        @store[idx].pop
    end
end

# Queue via Stack: Implement a MyQueue class which implements a queue using two stacks.
class MyQueue
    def initialize
        @s1 = Stack.new
        @s2 = Stack.new
    end
    
    def enqueue(v)
        @s1.push(v)
    end
    
    def dequeue
        if @s2.empty?
            @s2.push(@s1.pop) until @s1.empty? # UNTIL NOT UNLESS
        end
        @s2.pop
    end
end

# Balance Braces: Write a function that check whether a string has balancing parenthesis, 
# brackets, and curly braces. 
# For example, {}, [(){}], [{()}] are balanced. [(]), )()], {}), are not balanced.
# IMPORTANT *****************************
def balanced?(str)
    # See { or [ or (, push to stack
    return false if str.length % 2 == 1
    mat = Hash.new
    mat["}"] = "{"
    mat["]"] = "["
    mat[")"] = "("
    s = Stack.new
    str.each_char do |c|
        s.push(c) if c == '{' || c == '[' || c == '('
        if mat[c] == s.last
            s.pop
        end
    end
    s.empty? ? true : false # Ternary operator 
end
str1 = "{}"
str2 = "[(){}]"
str3 = "[{()}]"

str4 = "[(])"
str5 = "[[))"
str6 = "{})"
if balanced?(str6)
    p "TRUE"
else
    p "FALSE"
end