# http://stackoverflow.com/questions/20923780/how-to-explain-this-algorithm-for-calculating-the-power-of-a-number
def power(a, x)
    if x == 0
        return 1
    end
    
    res = power(a, x/2)
    if x % 2 == 0
        return res*res
    else
        return a*res*res
    end
end

p power(2, 8)