# LinkedList = Array      # Use Array as reference implementation
require './linked_list' # uncomment when ready to use your own linked_list.rb and comment out line #1
require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'

describe LinkedList do
  before do
    @list = LinkedList.new
  end

  describe 'basics' do
    it 'returns 0 length by default' do
      @list.length.must_equal 0
    end

    it 'increments length with pushes' do
      @list.push 'hi'
      @list.length.must_equal 1
      @list.push 'yo'
      @list.length.must_equal 2
    end

    it 'gets elements present with at' do
      @list.at(0).must_equal nil
      @list.push 'hi'
      @list.at(0).must_equal 'hi'
    end
  end

  describe '#push' do
    it 'should add element to end of list and maintain order' do 
      @list.push 1
      @list.at(0).must_equal 1
      @list.push 2
      @list.at(1).must_equal 2
    end
  end

  describe '#pop' do
    it 'should return nil on an empty list' do
      @list.pop.must_equal nil
    end

    it 'should remove and return last element of list' do
      @list.push 1
      @list.push 2
      @list.pop.must_equal 2
    end

    it 'should return nil after all elements popped off list' do
      @list.push 1
      @list.pop.must_equal 1
      @list.at(0).must_equal nil
    end

    it 'should return correct length and remaining elements after pop' do
      @list.push 1
      @list.push 2
      @list.pop.must_equal 2
      @list.at(0).must_equal 1
      @list.length.must_equal 1
    end
  end

  describe '#shift' do

    it 'should return nil on an empty list' do
      @list.shift.must_equal nil
    end

    it 'should return nil after all elements shifted off list' do
      @list.push 1
      @list.shift
      @list.at(0).must_equal nil
    end

    it 'should remove and return first element of list' do
      @list.push 1
      @list.push 2
      @list.shift.must_equal 1
    end

    it 'should return correct length and remaining elements after shift' do
      @list.push 1
      @list.push 2
      @list.shift
      @list.at(0).must_equal 2
      @list.length.must_equal 1
    end
  end

  describe '#unshift' do
    it 'should add element before current first element of list' do
      @list.unshift 1
      @list.unshift 'cat'
      @list.at(0).must_equal 'cat'
      @list.at(1).must_equal 1
      @list.length.must_equal 2
    end
  end

  describe '#to_a' do
    it 'should return a copy of linked list as a normal array' do
      @list.push 1
      @list.push 2
      @list.to_a.must_equal [1, 2]
    end
  end

  describe '#eql?' do
    # returns true if every element in list1 is .eql? to every element in list2

    before do
      @list1 = @list
      @list2 = LinkedList.new
      obj1 = {lol: 1}
      obj2 = 'asdf'
      @list1.push obj1
      @list1.push obj2
      @list2.push obj1
      @list2.push obj2
    end

    it 'is equal if both arrays are empty' do
      LinkedList.new.eql?(LinkedList.new).must_equal true
    end

    it 'is equal in trivial case' do
      @list1.eql?(@list2).must_equal true
    end

    it "doesn't care about the order of equality comparison" do
      @list2.eql?(@list1).must_equal true
    end

    it 'returns false when lists are different lengths' do
      @list1.pop
      @list1.eql?(@list2).must_equal false
    end

    it 'returns false if an element differs' do
      @list1.pop
      @list1.push 'nope'
      @list1.eql?(@list2).must_equal false
    end
  end

  describe '#dup' do
    it 'should return a new linked list with same elements in same order' do
      @list.push 1
      @list.push 2
      @new_list = @list.dup
      @new_list.at(0).must_equal 1
      @new_list.at(1).must_equal 2
      @new_list.at(2).must_equal nil
    end

    it 'should return empty list in trivial case' do
      @new_list = @list.dup
      @new_list.at(0).must_equal nil
    end

    it 'should not mutate original list' do
      @list.push 1
      @list.push 2
      @list.length.must_equal 2
      @list.dup
      @list.at(1).must_equal 2
      @list.length.must_equal 2
    end
  end

  describe '#reverse' do
    it 'should return a new list with elements in reverse order' do
      @list.push 1
      @list.push 2
      @new_list = @list.reverse
      @new_list.at(0).must_equal 2
      @new_list.at(1).must_equal 1
      @new_list.at(2).must_equal nil
    end

    it 'should return empty list in trivial case' do
      @new_list = @list.reverse
      @new_list.at(0).must_equal nil
    end

    it 'should not mutate original list' do
      @list.push 1
      @list.push 2
      @list.length.must_equal 2
      @list.reverse
      @list.at(1).must_equal 2
      @list.length.must_equal 2
    end
  end

  describe '#reverse!' do
    it 'should return the list with elements in reverse order' do
      @list.push 1
      @list.push 2
      @list.push 3
      @list.reverse!
      @list.at(0).must_equal 3
      @list.at(1).must_equal 2
      @list.at(2).must_equal 1
      @list.at(3).must_equal nil
    end

    it 'should return empty list in trivial case' do
      @list.reverse!
      @list.at(0).must_equal nil
    end

    it 'should have same length after reverse!' do
      @list.push 1
      @list.push 2
      @list.length.must_equal 2
      @list.reverse!
      @list.length.must_equal 2
    end

    it 'should be class LinkedList' do
      @list.push 1
      @list.reverse!
      @list.class.must_equal LinkedList
    end
  end

  describe '#each' do
    it 'should call a block for each element in the list' do
      array = []
      @list.push 1
      @list.push 2
      @list.each { |n| array << n }
     array.must_equal [1, 2]
    end
  end

  describe '#inject' do
    it 'should return nil with list length 0 and no default argument' do
      @list.inject { |memo, n| memo }.must_equal nil
    end

    it 'should return default value with list length 0 and default argument' do
      @list.inject(3) { |memo, n| memo }.must_equal 3
    end

    it 'should return value of list with list length 1 and no default argument' do
      @list.push 1
      @list.inject { |memo, n| memo }.must_equal 1
    end

    it 'should do likewise in nil case' do
      @list.push nil
      @list.inject { |memo, n| memo }.must_equal nil
    end

    before do
      @list2 = LinkedList.new
      @list2.push 1
      @list2.push 2
      @list2.push 3
      @list2.push 4

      @list3 = LinkedList.new
      @list3.push 'a'
      @list3.push 'b'
    end

      it 'should work how inject is supposed to with no default arg and a block' do
        @list2.inject { |memo, n| memo + n }.must_equal 10
        @list2.inject { |memo, n| memo * n }.must_equal 24
        @list3.inject { |memo, n| memo + n }.must_equal 'ab'
      end

      it 'should work how inject is supposed to with default arg and a block' do
        @list2.inject(10) { |memo, n| memo + n }.must_equal 20
        @list2.inject(2) { |memo, n| memo * n }.must_equal 48
        @list3.inject('ba') { |memo, n| memo + n }.must_equal 'baab'
      end

      it 'should work how inject is supposed to with no block' do
        @list.inject(10) { }.must_equal 10
        @list2.inject(10) { }.must_equal nil
      end
  end

end
