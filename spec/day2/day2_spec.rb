require_relative '../../day2/cube_conundrum.rb'
require_relative '../../day2/constants.rb'
RSpec.describe 'Day 2 Cube Conundrum' do
  it 'Should return a sum of the possible games 1,2 and 5 => 8' do
    cube_conundrum = CubeConundrum.new('./spec/day2/input_test1.txt',DEFAULT_CUBES)
    expect(cube_conundrum.get_possible_games_sum).to eq 8 # [1,2,5]
  end
end