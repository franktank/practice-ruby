class String
  def toJadenCase
    # ...
    str_arr = self.split(" ")
    str_arr = str_arr.map { |a| a[0].upcase + a[1..a.length] }
    str_arr = str_arr.join(" ")
  end
end

# Not Jaden-Cased: "How can mirrors be real if our eyes aren't real"
# Jaden-Cased:     "How Can Mirrors Be Real If Our Eyes Aren't Real"