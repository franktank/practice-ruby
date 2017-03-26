# Find closest num in array
a = [-1,-12,-20,12,54,32,64,100,2,11,67]
num = 3

def closest_num(a, num)
    closest_ind = 0
    dist = (a[0] - num).abs
    a.each_with_index do |e, i|
        curr_dist = (e - num).abs
        if curr_dist < dist
            dist = curr_dist
            closest_ind = i
        end
    end
    closest_ind
end

c = closest_num(a, num)
p c
p a[c]