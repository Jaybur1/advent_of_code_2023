require_relative "trebuchet"
require_relative "../helpers.rb"

trebuchet = Trebuchet.new('./day1/input.txt')

puts Output.title(1, 'Trebuchet')
# part 1
puts Output.solution(1,trebuchet.get_code)

# part 2
puts Output.solution(2,trebuchet.get_code_with_words)
