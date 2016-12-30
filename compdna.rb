# In DNA strings, symbols "A" and "T" are complements of each other, as "C" and "G". 
# You have function with one side of the DNA (string, except for Haskell); you need to get the other complementary side. 
# DNA strand is never empty or there is no DNA at all (again, except for Haskell).

def DNA_strand(dna)
  n = dna.split("")
  mapping = {'T' => 'A', 'A' => 'T', 'C' => 'G', 'G' => 'C'}
  n = n.map {|e| mapping[e] || e}
  n = n.join("")
  return n
end

# best solution

def DNA_strand(dna)
  dna.tr('ATCG','TAGC')
end

#tr(from_str, to_str) => new_str
#Returns a copy of str with the characters in from_str replaced by the corresponding characters in to_str. If to_str is shorter than from_str, it is padded with its last character in order to maintain the correspondence.

"hello".tr('el', 'ip')      #=> "hippo"
"hello".tr('aeiou', '*')    #=> "h*ll*"