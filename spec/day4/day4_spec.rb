require_relative '../../day4/scratchcards.rb'

RSpec.describe 'Day 4 Scratchcards' do
  scratchcards = Scratchcards.new('./spec/day4/input_test.txt')
  it 'Part 1: Should return 4361 which is the sum of the valid part numbers' do
    expect(scratchcards.get_sum_points).to eq 13
  end

  it.skip 'Part 2: Should return' do
    # expect(scratchcards.get_sum_points).to eq 13
  end
end
