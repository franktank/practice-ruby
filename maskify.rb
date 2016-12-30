def mask(cc)
    if cc.length < 4
        return cc
    else
        n = cc.length - 4
        for i in 0..n-1
            cc[i] = "#"
        end
        return cc
    end
end

puts mask("1231232132132313")