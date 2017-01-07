def cas(count_this)
    return "" if count_this == 0
    return "1" if count_this == 1

    prev = "1"
    current = prev
    for i in 2..count_this # Loop to find item in the sequence
        prev += '@' # Need this for extra iteration to check last item, @ is a dummy character
        current = ""
        count = 1
        for j in 1..prev.length # Loop through entire previous string to build next string in sequence
            if prev[j] != prev[j-1] && j < prev.length # Dont count the last one (@), check to see if nonmatch is found
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
end
# 1211 becomes 111221
# 21 becomes one two, one one -> 1211
# Generate 1 to n terms

puts cas(3)