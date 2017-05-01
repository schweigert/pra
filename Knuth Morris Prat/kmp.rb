class KMP
  attr_reader :results
  def initialize string, pattern
    @string = string
    @pattern = pattern
    @string_length = string.length
    @pattern_length = pattern.length
    @table = kmp_table
    @results = []
    kmp
  end

  def kmp_table
    prefix_table = [0]
	match_count = 0
    (1...@pattern_length).each do |pattern_counter|
      if (match_count > 0 && (@pattern[match_count] != @pattern[pattern_counter]))
        match_count = prefix_table[match_count -1] || 0
      end
      if @pattern[match_count] == @pattern[pattern_counter]
        match_count += 1
      end
      prefix_table[pattern_counter] = match_count
    end
    return prefix_table
  end

  def kmp
    string_counter, pattern_counter, potential_match_index = 0, 0, 0
    string_length = @string.length
    prefix_table_length = @table.length

    while string_length - potential_match_index > prefix_table_length - 1 do
      while pattern_counter < prefix_table_length - 1  && @string[string_counter ] == @pattern[pattern_counter] do
        string_counter += 1
        pattern_counter += 1
      end
      if pattern_counter >= prefix_table_length - 1
      @results << potential_match_index
      end
      if @table[pattern_counter - 1] !=nil && @table[pattern_counter - 1] > 0
        potential_match_index = string_counter - @table[pattern_counter -1]
      else
        if string_counter == potential_match_index
          string_counter += 1
        end
        potential_match_index = string_counter
      end
      if pattern_counter > 0
        pattern_counter = @table[pattern_counter -1]
      end
    end
    @results
  end
end

KMP.new("cozacocacolacococacolacocacoladjejdeicocacola", "cocacola")
# tests
puts "KMP"
puts '*' * 40

# match
test_str     = "cozacocacolacococacolacocacoladjejdeicocacola"
test_pattern = "cocacola"
should_be    = [4, 14, 22, 37]
test         = KMP.new test_str, test_pattern

p test.results
raise "This is wrong" unless test.results == should_be

# no match

test_str2     = "How do you do? Great thanks!"
test_pattern2 = "potato"
should_be2    = []
test2         = KMP.new test_str2, test_pattern2

p test2.results
raise "This is wrong" unless test2.results == should_be2

