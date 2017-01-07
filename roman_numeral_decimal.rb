def roman_to_decimal(roman)
    arr = roman.split("")
    num_arr = Array.new(arr.length)
    arr.each.with_index do |ele, i|
        if ele == "I"
            num_arr[i] = 1
        elsif ele == "V"
            num_arr[i] = 5
        elsif ele == "X"
            num_arr[i] = 10
        elsif ele == "L"
            num_arr[i] = 50
        elsif ele == "C"
            num_arr[i] = 100
        elsif ele == "D"
            num_arr[i] = 500
        elsif ele == "M"
            num_arr[i] = 1000
        end
    end
    

    dec_of_roman = 0
    i = 0
    while i < num_arr.length
        if i + 1 < num_arr.length
            if num_arr[i] < num_arr[i + 1]
                num_to_add = num_arr[i + 1] - num_arr[i]
                dec_of_roman += num_to_add
                i += 1
            else
                dec_of_roman += num_arr[i]
            end
        else
            # Add last number
            dec_of_roman += num_arr[i] 
        end
        i += 1
    end
    puts dec_of_roman
end

roman_to_decimal("XXXIX")
roman_to_decimal("MCMIV")
roman_to_decimal("XXIXV")