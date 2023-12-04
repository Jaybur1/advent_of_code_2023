class Scratchcards
  def initialize(input_file)
    @input = File.readlines(input_file, chomp: true)
  end

  def get_sum_points()
    total_points = 0
    @input.each do |line|
      card_points = 0
      winning, actual = line.gsub(/Card\s+\d+: /,'').split('|')
      winning = winning.split(' ')
      actual = actual.split(' ')

      actual.each do |num|
        if winning.include?(num)
          card_points = card_points > 0 ? card_points * 2 : 1
        end
      end
      total_points += card_points
    end
    total_points
  end
  def get_sum_scratchcards()
    cards = Array.new(@input.length, 0)
    total_cards = 0

    @input.each_with_index do |line, i|
      winning, actual = line.gsub!(/Card\s+\d+: /,'').split('|')
      winning = winning.split(' ')
      actual = actual.split(' ')

      count = cards[i] + 1
      total_cards += count
      wins = 0

      actual.each do |num|
        if winning.include?(num)
          wins += 1
          cards[i + wins] += count
        end
      end
    end
    total_cards
  end
end
