require_relative "../../day1/trebuchet.rb"
# part 1

RSpec.describe "a specification" do
  it "Should return 142 (part1)" do
    trebuchet = Trebuchet.new('./spec/day1/day1part1test.txt')
    expect(trebuchet.get_code).to eq 142
  end

  it "Should return 281 part(2)" do
    trebuchet = Trebuchet.new('./spec/day1/day1part2test.txt')
    expect(trebuchet.get_code_with_words).to eq 281
  end
end

