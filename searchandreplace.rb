def sr(m, text)
    occurrences = Hash.new
    for i in 0..m.length
        m.each do |key, value|
            if text.index(key)
                occurrences[text.index(key)] = key
            end
        end
        if occurrences.empty?
            break
        end
        sorted_keys = occurrences.keys.sort
        f_o = sorted_keys[0]
        a_key = occurrences[f_o]
        replace_val = m[a_key]
        text = text.sub(a_key, replace_val)
        puts text
        occurrences.clear    
    end
end

maperoni = Hash.new
maperoni[":)"] = "<colonparanthesis>"
maperoni[":laughing:"] = "<hahaha>"
sr(maperoni, "hi:laughing:):)")
# :) maps to <smiling-html>
# :laughing: maps to <laughing-html>