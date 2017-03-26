# https://docs.ruby-lang.org/en/2.0.0/Array.html
a = [-20, -10, 3, 4, 5, 10]
a2 = [400, 100, 9, 16, 25, 100]

# Partition array between negative and positive
# Square each array separately
# Merge algorithm

def square_this(a)
    # find last index of negative number
    ind_of_last_neg = -1
    i = 0
    while true
        if a[i] > 0
            ind_of_last_neg = i-1
            break
        end
        i += 1
    end
    neg_arr = a[0..ind_of_last_neg]
    pos_arr = a[ind_of_last_neg+1..-1]
    
    neg_arr.map! { |e| e*e }
    pos_arr.map! { |e| e*e }
    
    if ind_of_last_neg == -1
       pos_arr 
    else
        merge(neg_arr, pos_arr)
    end
end

def merge(a, b)
    fin = Array.new
    a_ind = 0
    b_ind = 0
    i = 0
    while a_ind < a.length && b_ind < b.length
        if a[a_ind] < b[b_ind]
            fin << a[a_ind]
            a_ind += 1
        else
            fin << b[b_ind]
            b_ind += 1
        end
    end
    
    if a_ind < a.length
        fin.concat(a[a_ind..-1])
    else
        fin.concat(b[b_ind..-1])
    end
end

b = [1,2,3,4,5]
p square_this(a)
p square_this(b)

# Basically split and merge


# Alt solution
# Place negative numbers in correct place by abs val?