#  require_relative "my_enum.rb"

#   [1, 2, 3, 4, 'hi'].my_each do |x|
#     puts x
#   end
# puts 'my_each test ends here'

# [1,2,3,4].my_each_with_index {|x,y| puts "#{x} is value #{y} is the index"}

# puts 'my_each_with_index test ends here'

# result = [1, 2, 3, 4, 5, 6].my_select(&:even?) #=> [2, 4, 6]
# puts result

# puts 'my_select test ends here'

# puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].my_all?(/t/) #=> false

# puts 'my_all? test ends here'

#   puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
#   puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
#   puts %w[ant bear cat].my_any?(/d/) #=> false
#   puts 'my_any? test ends here'

#     puts %w[ant bear cat].my_none? { |word| word.length == 5 } #=> true
# puts %w[ant bear cat].my_none? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].my_none?(/d/) #=> true

# puts 'my_all? test ends here'

# ary = [1, 2, 4, 2]
# puts ary.my_count #=> 4
# puts ary.my_count(2) #=> 2
# puts ary.my_count(&:even?) #=> 3

# puts 'my_count test ends here'

# puts (1..4).my_map { |i| i * i } #=> [1, 4, 9, 16]
# puts (1..4).my_map { 'dog' } #=> ["dog", "dog", "dog", "dog"]
# puts %w[a b c].my_map(&:upcase) #=> ["A", "B", "C"]
# puts %w[a b c].my_map(&:class) #=> [String, String, String]

# puts 'my_map test ends here'

# longest = %w[cat sheep bear].my_inject do |memo, word|
#   memo.length > word.length ? memo : word
# end
# puts longest #=> "sheep"
# puts (5..10).my_inject { |sum, n| sum + n } #=> 45
# puts (5..10).my_inject(2) { |sum, n| sum + n } #=> 47
# puts (1..5).my_inject(4) { |prod, n| prod * n } #=> 480

# puts 'my_inject test ends here'

# puts multiply_els([2,4,5])
