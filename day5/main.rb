require_relative "../helpers"
require_relative "seed-mapper"

puts Output.title(5,"Seed to Fertilizer")
seed_mapper = SeedMapper.new('./day5/input.txt')
puts Output.solution(1, seed_mapper.getLowestLocation)
puts Output.solution(2, "part 2 goes here")
