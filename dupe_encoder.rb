# The goal of this exercise is to convert a string to a new string where each character in the 
# new string is '(' if that character appears only once in the original string, 
# or ')' if that character appears more than once in the original string.
# Ignore capitalization when determining if a character is a duplicate.

# Examples:

# "din" => "((("
# "recede" => "()()()"
# "Success" => ")())())"
# "(( @" => "))(("

def duplicate_encode(word)
  #your code here
  characters = word.downcase.split("")
  counts = Hash.new(0)
  
  characters.each do |c|
    counts[c] += 1
  end
  
  characters = characters.map do |c|
    if counts[c] > 1
      c = ')'  
    else
      c = '('
    end
  end
  
  characters.join("")
end

# O(n)

puts duplicate_encode('din')

# Better solution?
def duplicate_encode(word)
  word
      .downcase
      .chars
      .map { |char| word.downcase.count(char) > 1 ? letter = ')' : letter = '(' }
      .join
end