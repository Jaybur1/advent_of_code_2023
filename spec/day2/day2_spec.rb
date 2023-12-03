require_relative '../../day2/cube_conundrum.rb'
require_relative '../../day2/constants.rb'
RSpec.describe 'Day 2 Cube Conundrum' do
  cube_conundrum = CubeConundrum.new('./spec/day2/input_test1.txt',DEFAULT_CUBES)
  it 'Part 1: Should return a sum of the possible games 1,2 and 5 => 8' do
    expect(cube_conundrum.get_sum_possible_games).to eq 8 # [1,2,5]
  end

  it "Part2: Should return 2286 a sum of powers of minimum set of cubes 48 + 12 + 1560 + 630 + 36" do
    expect(cube_conundrum.get_sum_power).to eq 2286
  end

end