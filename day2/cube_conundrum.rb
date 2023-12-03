class CubeConundrum
  def initialize(input_file, cubes)
    @cubes = cubes
    @input_file = input_file
  end
  # part 1
  def get_sum_possible_games()
    sum = 0
    File.readlines(@input_file, chomp: true).each_with_index do |line, i|
      id = i + 1
      sum += is_possible?(line.gsub!(/Game\s\d+:\s/, '').split(';')) ? id : 0
    end
    sum
  end

  # part 2
  def get_sum_power()
    sum = 0
    File.readlines(@input_file, chomp: true).each_with_index do |line, i|
      sum += get_power(line.gsub!(/Game\s\d+:\s/, '').split(';'))
    end
    sum
  end

  private
  def is_possible?(game)
    game.each do |round|
      round_cubes = Hash.new(0)

      round.split(',').each do |attempt|
        amount, color = attempt.strip.split(' ')
        round_cubes[color] += amount.to_i
      end
      return false unless round_cubes.all? { |color, amount| amount <= @cubes[color]}
    end
    true
  end

  def get_power(game)
    game_min_cubes = Hash.new(0)
    game.each do |round|
      round.split(',').each do |attempt|
        amount, color = attempt.strip.split(' ')
        game_min_cubes[color] = [game_min_cubes[color], amount.to_i].max
      end
    end
    game_min_cubes.values.reject(&:zero?).inject(:*)
  end

end