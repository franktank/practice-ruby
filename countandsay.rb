def cas(count_this)
    return "" if count_this == 0
    return "1" if count_this == 1
    return "11" if count_this == 2
    
    prev = "11"
    current = prev
    for i in 3..count_this
        prev += '@'
        current = ""
        count = 1
        for j in 1..prev.length
            if prev[j] != prev[j-1] && j < prev.length
                current += "#{count}"
                current += "#{prev[j-1]}"
                count = 1
            else
                count += 1
            end
        end
        prev = current
    end
    current
    puts prev
end
# 1211 becomes 111221
# 21 becomes one two, one one -> 1211
# Generate 1 to n terms

cas(3)