require_relative "gear_ratios"
require_relative "../helpers.rb"

puts Output.title(3,'Gear Ratios')
gear_ratios = GearRatios.new('./day3/input.txt')

puts Output.solution(1, gear_ratios.get_sum_parts_numbers)
