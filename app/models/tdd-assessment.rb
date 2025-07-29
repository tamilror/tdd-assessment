class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..]
      delimiter = Regexp.escape(custom_delimiter)
    end

    nums = numbers.split(/#{delimiter}/).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end

    nums.sum
  end
end

# Test cases
puts StringCalculator.add("")                # => 0
puts StringCalculator.add("1")               # => 1
puts StringCalculator.add("1,5")             # => 6
puts StringCalculator.add("1\n2,3")          # => 6
puts StringCalculator.add("//;\n1;2")        # => 3
puts StringCalculator.add("//#\n2#3#4")      # => 9
puts StringCalculator.add("4,-2,5,-7")       # => Exception
