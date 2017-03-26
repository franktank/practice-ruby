# Return k-th largest element in array
# Sort and return kth index
# O(n lg n)
a = [1,2,3,4,5,6,7,8]
b = [2,5,12,23,10,9,6]
def ret_kth_largest(a, k)
    a.sort!.reverse!
    a[k-1]
end

p ret_kth_largest(a, 8)
p ret_kth_largest(b, 1)

# EASIER WAY WOULD TO BE SEND SUBARRAYS THROUGH

# O(n) possible?
# Keep random partition?
# Partition around a number, that number will be in place
# Partition is O(n) time
# http://www.geeksforgeeks.org/kth-smallestlargest-element-unsorted-array-set-3-worst-case-linear-time/
def k_select(a, start, fin, k)
    # fin is last index in array range
    # partition, if ind swapped is == k, then kth element
    if start == fin
        return a[start]
    end
    
    a, idx = random_partition(a, start)
    part_kth_largest = fin - idx + 1
    if part_kth_largest == k
        return a[idx]
    elsif k > part_kth_largest
        return k_select(a, start, idx - 1, k - part_kth_largest)
    else
        return k_select(a, idx + 1, fin, k)
    end
end

def random_partition(a, s)
    len = a.length
    r_idx = rand(len)
    
    # swap
    t = a[r_idx]
    a[r_idx] = a[s]
    a[s] = t
    
    partition(a, s)
end

def partition(a, s)
    part_num = a[s]
    i = 0
    j = 0
    while j < a.length
        if a[j] < part_num
            i += 1
            temp = a[i]
            a[i] = a[j]
            a[j] = temp
        end
        j += 1
    end
    a[s] = a[i]
    a[i] = part_num
    return a, i
end


p "---_----_-___"

p ret_kth_largest(a, 8)
p k_select(a, 0, a.length - 1, 8)
p "  "
p ret_kth_largest(b, 1)
p k_select(b, 0, b.length - 1, 1)