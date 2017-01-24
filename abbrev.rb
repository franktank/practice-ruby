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
    string.gsub(/(\w)(\w{2,})(\w)/) do |word|
      "#{$1}#{$2.length}#{$3}"
    end
  end
end

puts Abbreviator.abbreviate("DOGGGGG-DOGGOOOOOOO")

# gsub -> find and replace all
=begin
  * Regex notes
  * () -> used to capture groups, $1,$2,..$n can be used to access what is captured
  * {2,} -> 2 or more
  * \w -> word character
  * #{} used for string interpolation
=end