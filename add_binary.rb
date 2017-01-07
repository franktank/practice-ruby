def add_binary(a, b)
    #convert binary to decimal, then add
    arr = [a, b]
    max_length = arr.max_by(&:length).length
    
    a_num = 0
    two_power = 0
    a.reverse.each_char do |i|
        i = i.to_i
        if i == 1 then a_num += i * 2**two_power end
        two_power += 1    
    end

    
    two_power = 0
    b_num = 0
    b.reverse.each_char do |j|
        j = j.to_i
        if j == 1 then b_num += j * 2**two_power end
        two_power += 1
    end
    
    dec_sum = a_num + b_num
    two_power = max_length + 1
    new_bin = ""
    
    while two_power >= 0
        if dec_sum - 2**two_power >= 0
            new_bin += "1"
        else
            new_bin += "0"
        end
        two_power -= 1
    end
    new_bin
end

a = "100"
b = "11"
puts add_binary(a, b)


# 90 / 2  = 45 / 2 = 22.5 / 2 = 11.25 / 2 = 5.5125