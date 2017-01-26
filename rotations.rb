def all_rotations(str, arr)
    (0..str.length).all? { |i| arr.include?(str.chars.rotate(x).join) } # Rotate string for array, check all possible rotations and see if included in array
end