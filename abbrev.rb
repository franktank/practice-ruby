# The word i18n is a common abbreviation of internationalization the developer community use instead of typing the whole word and trying to spell it correctly. Similarly, a11y is an abbreviation of accessibility.

# Write a function that takes a string and turns any and all "words" (see below) within that string of length 4 or greater into an abbreviation following the same rules.

# Notes:

# A "word" is a sequence of alphabetical characters. By this definition, any other character like a space or hyphen (eg. "elephant-ride") will split up a series of letters into two words (eg. "elephant" and "ride").
# The abbreviated version of the word should have the first letter, then the number of removed characters, then the last letter (eg. "elephant ride" => "e6t r2e").
# Example:

# abbreviate("elephant-rides are really fun!")
# //          ^^^^^^^^*^^^^^*^^^*^^^^^^*^^^*
# // words (^):   "elephant" "rides" "are" "really" "fun"
# //                123456     123     1     1234     1
# // ignore short words:               X              X

# // abbreviate:    "e6t"     "r3s"  "are"  "r4y"   "fun"
# // all non-word characters (*) remain in place
# //                     "-"      " "    " "     " "     "!"
# === "e6t-r3s are r4y fun!

# https://www.codewars.com/kata/5375f921003bf62192000746/train/ruby

class Abbreviator

  def self.abbreviate(string)
    # abbreviate the string
    arr = string.split(" ")
    puts arr
    arr = arr.map do |e|
      if e.scan(/[a-zA-Z]/i).size < 4
        e = e
      elsif h = e =~ /-/
        e = e.split("-").map { |w| w = w[0] + "#{w.length - 2}" + w[w.length - 1] }.join("-")
      elsif e =~ /[a-zA-Z](\W)/
        e = e.split(".")
        
      else
        e = e[0] + "#{e.length - 2}" + e[e.length - 1]
      end
    end
    arr.join(" ")
  end
  
end