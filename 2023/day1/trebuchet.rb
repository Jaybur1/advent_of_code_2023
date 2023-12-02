require_relative 'constants'
class Trebuchet
  def initialize(input_file)
    @input_file = input_file

    def get_code
      sum = 0
      File.readlines(@input_file, chomp: true).each do |line|
        sum += get_first_and_last_digit(line).to_i
      end

      sum
    end

    def get_code_with_words
      sum = 0
      File.readlines(@input_file, chomp: true).each do |line|
        sum += get_first_and_last_digit(line, true).to_i
      end

      sum
    end

    def word_to_number(str)
      str.to_f > 0 ? str : NUMBERS.find_index(str)
    end

    def get_first_and_last_digit(str, with_words = false)
      if with_words
        first = word_to_number(str[FIRST_REGEX])
        last = word_to_number(str[LAST_REGEX, 1])

        "#{first || 0}#{last || 0}"
      else
        digits = str.scan(/\d/).join('')
        digits.length ? "#{digits[0] || 0}#{digits[-1] || ''}" : '0'
      end
    end
  end
end