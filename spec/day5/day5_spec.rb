require_relative '../../day5/seed-mapper.rb'
RSpec.describe 'Day 5 Seed to Fertilizer' do

	describe 'Part 1' do
		it 'Should return 35 which is the sum of the lowest location (test input)' do
			seed_mapper = SeedMapper.new('./spec/day5/input_test.txt')
			expect(seed_mapper.getLowestLocation).to eq 35
		end
		it 'Should return 1181555926 which is the sum of the lowest location (real input)' do
			seed_mapper = SeedMapper.new('./day5/input.txt')
			expect(seed_mapper.getLowestLocation).to eq 1181555926
		end
	end



	# it.skip 'Part 2: Should return' do;end
end
