class Scratchcards
  def initialize(input_file)
    @input_file = input_file
  end

  def get_sum_points()
    total_points = 0
    File.readlines(@input_file, chomp: true).each do |line|
      card_points = 0
      formatted = line.gsub!(/Card\s+\d+: /,'').split('|')
      winning = formatted.first.split(' ')
      actual = formatted.last.split(' ')
      actual.each do |num|
        if winning.include?(num)
          card_points = card_points > 0 ? card_points * 2 : 1
        end
      end
      total_points += card_points
    end
    total_points
  end
end
