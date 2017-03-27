# Find majority element in sorted and unsorted array

def majority_element(a)
    a.sort
    a[a.length/2] # middle element is majority element if exists
end

def moore_vote(a)
    maj_ind = 0
    count = 1
    i = 1
    while i < a.length
        if a[i] == a[maj_ind]
            count += 1
        else
            count -= 1
        end
        if count == 0
            maj_ind = i
            count = 1
        end
        i += 1
    end
    a[maj_ind]
end


def maj_check?(a, maj_ele)
    count = 0
    a.each do |e|
        if e == maj_ele
            count += 1
        end
    end
    count >= a.length / 2
end

a = [2, 2, 3, 5, 3, 2, 2, 1]
t = moore_vote(a)
p "#{t} is maj ele" if maj_check?(a, t)