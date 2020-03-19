module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    (0...size).each do |x|
      yield self[x]
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    (0...size).each do |x|
      yield(self[x], x)
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    ar = []
    if block_given?
      my_each { |e| ar.push(e) if yield e }
    end
    ar
  end

  def my_all?(reg = nil)
    if !reg.nil?
      my_each { |x| return false unless reg === x }
    elsif block_given?
      my_each { |x| return false unless yield x }
    else
      my_each { |x| return false unless x }
    end
    true
  end

  puts 'my_all?'

  def my_any?(reg = nil)
    res = false
    if !reg.nil?
      my_each { |x| res = true if reg === x }
    elsif block_given?
      my_each { |x| res = true if yield(x) }
    else
      my_each { |x| res = true if x }
    end
    res
  end

  def my_none?(reg = nil, &block)
    !my_any?(reg, &block)
  end

  def my_count(list = nil)
    counter = 0

    if list
      my_each { |i| counter += 1 if list == i }
      counter
    elsif block_given?

      my_each { |i| counter += 1 if yield(i) }
      counter
    else
      size
    end
  end

  def my_map(prod = nil)
    arr = self.class == Range ? to_a : self
    res = []

    return to_enum(:my_map) unless block_given?

    if prod.nil?
      arr.my_each { |m| res.push(yield(m)) }

    else
      arr.my_each { |m| res.push(prod.call(m)) }
    end
    res
  end

  def my_inject(cum = nil, reg = nil)
    arr = self.class == Range ? to_a : self
    if cum.nil?
      cum = arr[0]
      index = 1
    else
      index = 0
    end

    (index...size).each do |x|
      if block_given?
        cum = yield(cum, arr[x])
      elsif cum.is_a?(Symbol) || reg.is_a?(Symbol)
      end
    end
    return arr.reduce(:+) if reg.nil? && cum.is_a?(Symbol)
    return cum += arr.reduce(:+) if reg.is_a?(Symbol) && cum.is_a?(Integer)

    cum
  end
end

def multiply_els(arr)
  arr.my_inject { |acc, val| acc * val }
end
