require_relative '../../day3/gear_ratios.rb'

RSpec.describe 'Day 3 Gear Ratios' do
  gear_ratios = GearRatios.new('./spec/day3/input_test.txt')
  it 'Part 1: Should return 4361 which is the sum of the valid part numbers' do
    expect(gear_ratios.get_sum_parts_numbers).to eq 4361
  end

  it 'Part 2: Should return 467835 which is the sum of all gear ratios' do
    expect(gear_ratios.get_sum_gear_ratios).to eq 467835
  end
end
