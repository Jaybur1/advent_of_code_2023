require_relative '../../day3/gear_ratios.rb'

RSpec.describe 'Day 3 Gear Ratios' do
  cube_conundrum = CubeConundrum.new('./spec/day2/input_test1.txt',DEFAULT_CUBES)
  it 'Part 1: Should return 4361 which is the sum of the valid part numbers' do
    gear_ratios = GearRatios.new('./spec/day3/input_test.txt')
    expect(gear_ratios.get_sum_parts_numbers).to eq 4361
  end
end