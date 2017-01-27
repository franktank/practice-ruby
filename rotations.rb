def all_rotations(str, arr)
    (0..str.length-1).all? { |i| arr.include?(str.chars.rotate(i).join) } # Rotate string for array, check all possible rotations and see if included in array
end