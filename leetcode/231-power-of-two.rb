# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
    if n == 1
        return true
    end
    if n == 0
        return false
    end
    while n % 2 == 0
        n /= 2
        if n == 1
            return true
        end
    end
    false
end