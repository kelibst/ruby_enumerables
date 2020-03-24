require_relative '../my_enum.rb'
describe Enumerable do
  let(:array) { [2, 4, 5, 7, 6] }
  describe '#my_each' do
    it 'should return an enumerator class' do
      expect(array.my_each.class).to eq(array.each.class)
      expect(array.my_each.class).not_to eq('Integer')
    end

    it 'should return the array values' do
      expect(array.my_each { |num| num }).to eq(array)
    end
  end

  describe '#my_each_with_index' do
    it 'should return an enumerator class when no block is given' do
      expect(array.my_each_with_index.class).to eql(array.each_with_index.class)
    end

    it 'should return the elements and their index' do
      expect(array.my_each_with_index { |num| num }).to eq(array) # positive
    end
  end

  describe '#my_select' do
    it 'should return an enumerator if a block is not given' do
      expect(array.my_select.class).to eq(array.select.class)
    end

    it 'should return the even numbers in the array given' do
      expect(array.my_select(&:even?)).to eq([2, 4, 6])
    end

    it 'should return the odd numbers in the array given' do
      expect(array.my_select(&:odd?)).to eq([5, 7])
    end
  end

  describe '#my_all?' do
    it 'should return true if nothing in the array is false' do
      expect([1, 2i, 3.14].my_all?(Numeric)).to eq(true)
    end

    it 'should return false when one of the elements in the array does not contain the regex character' do
      expect(%w[ant bear cat].my_all?(/t/)).to eq(false)
    end
  end

  describe '#my_any?' do
    it 'should return true if at least one element of the array is true to a condition.' do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eq(true)
    end

    it 'should return true if a regex passed as arguement is detected.' do
      expect(%w[ant bear cat].my_any?(/d/)).to eq(false)
      expect(%w[dog door rod blade].my_any?(/d/)).to eq(true)
    end
  end

  describe '#my_none?' do
    it 'should return return true if none of elements are true.' do
      expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to eq(true)
      expect(%w[ant bear cat].my_none? { |word| word.length >= 4 }).to eq(false)
    end

    it 'should return true if an empty array is passed to it' do
      expect([].my_none?).to eq(true)
      expect([nil].my_none?).to eq(true)
    end

    it 'should be able to work with regular expressions' do
      expect(%w[dog door rod blade].my_none?(/d/)).to eq false
    end
  end

  describe '#mycount' do
    it 'should return a count of the element passed as an argument' do
      expect(array.my_count).to eq(5)
      expect(array.my_count(&:even?)).to eq(3)
    end
  end
end
