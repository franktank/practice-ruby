def descending_order(n)
  #...
  n = n.to_s.split("").sort.join.reverse.to_i
end

Test.assert_equals(descending_order(0), 0)
Test.assert_equals(descending_order(1), 1)
Test.assert_equals(descending_order(123456789), 987654321)