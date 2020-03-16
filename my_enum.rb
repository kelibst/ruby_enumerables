module Enumerable
  def my_each
    for x in 0...self.length
      yield self[x]
    end
    self
  end


  def my_each_with_index
    for x in 0...self.length
      yield(self[x], x)
      self
    end
  end


  def my_select
    ar = []

    self.my_each { |e|
      ar.push(e) if yield e
    }

    ar
  end



  def my_all?(reg = nil)
    res = true

    self.my_each { |e|
      if reg.nil?
        res = false unless yield e
      end
      if !reg.nil?
        res = false unless e =~ reg
      end
    }
    res
  end



  def my_any?(reg = nil)
    res = false
    self.my_each { |e|
      if reg.nil?
        res = true if (yield e)
    end
      if !reg.nil?
        res = true if e =~ reg
      end
    }
    res
    end



  def my_none?(reg = nil)
    res = true
    self.my_each { |e|
      if reg.nil?
        res = false if yield e

      else
        res = false if e =~ reg
      end
    }
    res
  end



  def my_count(li = nil)
    counter = 0

    if li
      self.my_each { |i| counter += 1 if li == i }
      counter
    elsif block_given?

      self.my_each { |i| counter += 1 if yield(i) }
      counter
    else
      size
    end
  end



  def my_map(pr = nil)
    arr = self.class == Range ? to_a : self
    res = []

    if pr.nil?
      arr.my_each { |m| res.push(yield(m)) }
    else
      arr.my_each { |m| res.push(pr.call(e)) }
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

    for x in index...size
      cum = yield(cum, arr[x])
    end
    cum
  end


end

def multiply_els(arr)
  arr.my_inject { |acc, val| acc * val }
end
