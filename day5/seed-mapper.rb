class SeedMapper
  def initialize(input_file)
    @input = File.readlines(input_file, chomp: true)
  end

  def getLowestLocation
    seeds, mappings = getMappingPartsFromInput()
    lowest_location = nil
    # p mappings
    seeds.each do |seed|
      seed_location = seed.to_i

      mappings.values.each do |mapper|
        mapper.each do |line|
          destination, source, range = line
          range = range - 1

          if (source..(source + range)).include? seed_location
            seed_location = seed_location - source + destination
            break
          end
        end
      end
      lowest_location = [lowest_location, seed_location].min unless lowest_location.nil?
      lowest_location = seed_location if lowest_location.nil?
    end
    lowest_location
  end

  private
  def getMappingPartsFromInput
    seeds = @input[0].scan(/(\d+)/).flatten.map(&:to_i)
    mappings = @input.slice(1..@input.length).filter { |line| line != "" }.reduce(Hash.new()) { |hash, line|

      if line.match(/[^\d\s]/)
        hash[line.gsub!(" map:", "")] = []
      else
        hash[hash.keys[-1]].append(line.split(/\s/).map(&:to_i))
        hash[hash.keys[-1]].flatten
      end
      hash
    }

    [seeds, mappings]
  end

end
