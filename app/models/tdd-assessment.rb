def add(numbers)
    return 0 if numbers.strip.empty?
  
    delimiter = /,|\n/
    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..]
      delimiter = Regexp.escape(custom_delimiter)
    end
  
    # Split and convert to integers
    nums = numbers.split(/#{delimiter}/).map(&:to_i)
  
    # Check for negative numbers
    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end
  
    nums.sum
  end

#Test Result

#puts add("")                # => 0
#puts add("1")               # => 1
#puts add("1,5")             # => 6
#puts add("1\n2,3")          # => 6
#puts add("//;\n1;2")        # => 3
#puts add("//#\n2#3#4")      # => 9
#puts add("4,-2,5,-7")       # => Exception: negative numbers not allowed -2,-7
