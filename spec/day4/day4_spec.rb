require_relative '../../day4/scratchcards.rb'

RSpec.describe 'Day 4 Scratchcards' do
  scratchcards = Scratchcards.new('./spec/day4/input_test.txt')
  it 'Part 1: Should return 13 which is the points count ' do
    expect(scratchcards.get_sum_points).to eq 13
  end

  it 'Part 2: Should return 30 which is the scratchcards count' do
    expect(scratchcards.get_sum_scratchcards).to eq 30
  end

end
