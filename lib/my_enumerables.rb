module Enumerable
  # Your code goes here
  def my_each_with_index
    counter = 0
    self.my_each do |element|
      yield(element, counter)
      counter+=1
    end
  end

  def my_select
    new_arr = []
    self.my_each do |element|
      new_arr << element if yield(element)
    end
    return new_arr
  end

  def my_all?
    bool_tracker = false
    self.my_each do |elem|
      bool_tracker = yield(elem)
    end
    return bool_tracker
  end

  def my_any?
    any_tracker = false
    self.my_each do |elem|
      any_tracker = yield(elem)
      break if any_tracker
    end
    return any_tracker
  end

  def my_none?(&block)
    arr = self.my_select(&block)
    return arr.size== 0
  end

  def my_count(&block)
    if block_given?
      return self.my_select(&block).size
    else
      return self.size
    end
  end

  def my_map
    arr = []
    self.my_each do |elem|
      arr << yield(elem)
    end
    return arr
  end

  def my_inject(initial_value, &block)
    self.reduce(initial_value, &block) 
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element)
    end
  end
end
