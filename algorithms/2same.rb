# Write an algorithm that tells me if 2 and only two numbers in a 1x3 array are the same. 

a1 = [1,1,2]
a2 = [1,2,3]
a3 = [1,1,1]

def only_two_same?(a)
    count = Hash.new(0)
    a.each do |e|
        count[e] += 1
    end
    
    count.each do |key, val|
        if val == 2
            return true
        end
    end
    false
end
t = [1,1,2,3,4,5]

p "true1" if only_two_same?(a1)
p "true2" if only_two_same?(a2)
p "true3" if only_two_same?(a3)
p "trueee" if only_two_same?(t)