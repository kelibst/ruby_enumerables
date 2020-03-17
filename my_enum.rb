module Enumerable
  def my_each
    for x in 0...size # rubocop:disable Style/For
      yield self[x]
    end
    self
  end

  def my_each_with_index
    for x in 0...size # rubocop:disable Style/For
      yield(self[x], x)
      self # rubocop:disable Lint/Void
    end
  end

  def my_select
    ar = []

    my_each { |e| ar.push(e) if yield e }

    ar
  end

  def my_all?(reg = nil)
    res = true

    my_each do |e|
      if reg.nil?
        res = false unless yield e
      end
      unless reg.nil?
        res = false unless e =~ reg
      end
    end
    res
  end

  def my_any?(reg = nil)
    res = false
    my_each do |e|
      if reg.nil?
        res = true if yield e
      end
      unless reg.nil?
        res = true if e =~ reg
      end
    end
    res
  end

  def my_none?(reg = nil)
    res = true
    my_each do |e|
      if reg.nil?
        res = false if yield e

      elsif e =~ reg
        res = false
      end
    end
    res
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

    if prod.nil?
      arr.my_each { |m| res.push(yield(m)) }
    else
      arr.my_each { |m| res.push(prod.call(m)) }
    end
    res
  end

  def my_inject(cum = nil)
    arr = self.class == Range ? to_a : self
    if cum.nil?
      cum = arr[0]
      index = 1
    else
      index = 0
    end

    for x in index...size # rubocop:disable Style/For
      cum = yield(cum, arr[x])
    end
    cum
  end
end

def multiply_els(arr)
  arr.my_inject { |acc, val| acc * val }
end
