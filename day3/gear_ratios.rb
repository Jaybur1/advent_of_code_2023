class GearRatios
  def initialize(input_file)
    @input = File.readlines(input_file, chomp: true)
  end

  # part 1 TODO: refactor
  def get_sum_parts_numbers;
    sum = 0
    @input.each_with_index do |line, i|
      # get all the serial numbers
      serials =  get_serial_numbers_with_index(line)
      serials.each do |serial_set|
        # add to the sum if its a valid serial number
        sum += serial_set.first.to_i unless !symbol_adjacent?(serial_set, line, i)
      end
    end
    sum
  end
  # part 2 TODO:
  def get_sum_gear_ratios
    sum = 0
    @input.each_with_index do |line, i|
      get_gears_with_index(line).each do |possible_gear|
        sum += get_sum_adjacent_ratios(possible_gear, line, i)
      end
    end
    sum
  end

  private
  def symbol_adjacent?(serial_set,line ,i)
    serial, start_index, end_index = serial_set

    prev_line = @input[i - 1] if i > 0
    next_line = @input[i + 1] if i < @input.length - 1
    left_index = start_index - 1
    index_range =lambda {|_line| (start_index > 0 ? left_index : 0)..(end_index < _line.length - 1 ? end_index : _line.length - 1)}

    # check top/bottom include diagonal adjacent symbols and also left and right
    adj_left = true if start_index > 0 && line[left_index].match(/[^0-9.]/)
    adj_right = true if end_index < line.length - 1 && line[end_index].match(/[^0-9.]/)
    adj_top = true if prev_line && prev_line[index_range.call(prev_line)].match(/[^0-9.]/)
    adj_bottom = true if next_line && next_line[index_range.call(next_line)].match(/[^0-9.]/)

    # return true if one of the conditions is true
    adj_left || adj_right || adj_top || adj_bottom
  end

  def get_serial_numbers_with_index(line)
    # returns [serial string, start index, end index]
    serial_numbers = []
    line.scan(/(\d+)/) do |num_match|
      serial = num_match.first
      start_index = Regexp.last_match.begin(0)
      serial_numbers << [ serial, start_index, start_index + serial.length]
    end
    serial_numbers
  end

  def get_gears_with_index(line)
    gears = []
    line.scan(/(\*)/) do |num_match|
      gear = num_match.first
      start_index = Regexp.last_match.begin(0)
      gears << [ gear, start_index ]
    end
    gears
  end

  def get_sum_adjacent_ratios(possible_gear,line, i)
    _, index = possible_gear
    ratios = []
    current_line_serials= get_serial_numbers_with_index(line)
    prev_line_serials = get_serial_numbers_with_index(@input[i - 1]) if i > 0
    next_line_serials = get_serial_numbers_with_index(@input[i + 1]) if i < @input.length - 1
    # #check current line
    check_line_for_ratios(current_line_serials, ratios, index)
    # # #check prev line
    check_line_for_ratios(prev_line_serials, ratios, index)
    # # #check prev line
    check_line_for_ratios(next_line_serials, ratios, index)

    ratios.length == 2 ? ratios.last * ratios.first : 0
  end

  def check_line_for_ratios(line_serials, ratios, index)
    line_serials.each do |serial|
      value, start_index, end_index = serial

      left= index + 1 == start_index
      right = index == end_index
      in_range = (index >= start_index) && (index <= end_index - 1)

      ratios << value.to_i if left || right || in_range
    end if line_serials
  end
end
