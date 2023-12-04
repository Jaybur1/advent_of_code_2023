require_relative "scratchcards"
require_relative "../helpers"
puts Output.title(4,"Scratchcards")
scratchcards = Scratchcards.new('./day4/input.txt')
puts Output.solution(1, scratchcards.get_sum_points)
puts Output.solution(2, scratchcards.get_sum_scratchcards)
