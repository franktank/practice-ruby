def diamonds_and_toads(sentence, fairy) 
  # code here
  count_hash = Hash.new
  count_hash[:ruby] = 0
  count_hash[:crystal] = 0
  count_hash[:python] = 0
  count_hash[:squirrel] = 0
  is_good = true
  if fairy == :good
    count_hash[:ruby] += sentence.count('r')
    cap_r_count = sentence.count('R')
    count_hash[:ruby] += 2*cap_r_count
    
    count_hash[:crystal] += sentence.count('c')
    cap_c_count = sentence.count('C')
    count_hash[:crystal] += 2*cap_c_count
  else
    is_good = false
    count_hash[:python] += sentence.count('p')
    cap_p_count = sentence.count('P')
    count_hash[:python] += 2*cap_p_count
    
    count_hash[:squirrel] += sentence.count('s')
    cap_s_count = sentence.count('S')
    count_hash[:squirrel] += 2*cap_s_count
  end
  if is_good
    count_hash.delete(:squirrel)
    count_hash.delete(:python)
    if count_hash[:ruby] == 0
      count_hash.delete(:ruby)
    end
    if count_hash[:crystal] == 0
      count_hash.delete(:crystal)
    end
  else
    count_hash.delete(:ruby)
    count_hash.delete(:crystal)
    if count_hash[:python] == 0
      count_hash.delete(:python)
    end
    if count_hash[:squirrel] == 0
      count_hash.delete(:squirrel)
    end
  end
  count_hash
end