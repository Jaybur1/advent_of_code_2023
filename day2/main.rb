require_relative "cube_conundrum"
require_relative "constants"
require_relative "../helpers.rb"

puts Output.title(2, 'Cube Conundrum')

cube_conundrum = CubeConundrum.new('./day2/input.txt', DEFAULT_CUBES)

# part 1
puts Output.solution(1 ,cube_conundrum.get_sum_possible_games)

# part 2
puts Output.solution(2, cube_conundrum.get_sum_power)
