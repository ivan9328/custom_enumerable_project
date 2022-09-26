module Enumerable
  # Your code goes here
  def my_each_with_index
    return self unless block_given?
    i = 0
    for element in self do 
      yield element, i
      i += 1
    end
    return self
  end

  def my_select
    return self unless block_given?

    matches = []
    for element in self
      matches.push element if (yield element)
    end
    return matches
  end

  def my_all?
    return self unless block_given?

    all_match = true
    for element in self
      all_match = false if (!yield element)
    end
    return all_match
  end
  
  def my_any?
    return self unless block_given?

    any_match = false
    for element in self
      any_match = true if (yield element)
    end
    return any_match
  end

  def my_none?
    return self unless block_given?

    none_match = true
    for element in self
      none_match = false if (yield element)
    end
    return none_match
  end

  def my_count
    return self.size unless block_given?

    matches = 0
    for element in self
      matches += 1 if (yield element)
    end
    return matches
  end

  def my_map
    return self unless block_given?

    mapped = []
    for element in self
      mapped.push (yield element)
    end
    return mapped
  end

  def my_inject(initial = 0)
    return self unless block_given?

    accumulator = initial
    for element in self
      accumulator = yield accumulator, element
    end
    return accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    # Iterate over Array with passed block
    if block_given?
      self.length().times do |index|
        yield(self[index])
      end
      return self
    else
      return self.to_enum
    end
   end
end


gang = [4, 6, 8, 10, 90, 1]
gang.my_each { |ggs| puts "i am #{ggs}"}
gang.my_each_with_index { |ggs| puts "i am #{ggs}"}
#gang.each { |ggs| puts "i am #{ggs}"}
#gang.my_each