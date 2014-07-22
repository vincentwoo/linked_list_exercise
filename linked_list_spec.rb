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

    # feel free to add a few more simple ones
  end

  # more in depth specs per method here

  describe '#push' do
    it 'should maintain order' do 
      @list.push 1
      @list.at(0).must_equal 1
      @list.push 2
      @list.at(1).must_equal 2
    end
  end

  describe '#pop' do
    it 'should remove and return the last element of list' do
      @list.pop.must_equal nil
      @list.push 1
      @list.pop.must_equal 1
      @list.at(0).must_equal nil
      @list.push 1
      @list.push 2
      @list.pop.must_equal 2
      @list.at(0).must_equal 1
    end
  end

  describe '#shift' do
    it 'should remove and return first element of list' do
      @list.push 1
      @list.shift.must_equal 1
      @list.at(0).must_equal nil
      @list.push 1
      @list.push 2
      @list.shift.must_equal 1
      @list.at(0).must_equal 2
    end
  end

  describe '#unshift' do
    # it 'should add element before current first element of list'
    # end
  end

  describe '#to_a' do
    it 'should returns a copy of linked list as a normal array' do
      @list.push 1
      @list.push 2
      @list.to_a.must_equal [1, 2]
    end
  end

  # describe '#eql?' do
  #   # returns true if every element in list1 is .eql? to every element in list2

  #   before do
  #     @list1 = @list
  #     @list2 = LinkedList.new
  #     obj1 = {lol: 1}
  #     obj2 = 'asdf'
  #     @list1.push obj1
  #     @list1.push obj2
  #     @list2.push obj1
  #     @list2.push obj2
  #   end

  #   it 'is equal if both arrays are empty' do
  #     LinkedList.new.eql?(LinkedList.new).must_equal true
  #   end

  #   it 'is equal in trivial case' do
  #     @list1.eql?(@list2).must_equal true
  #   end

  #   it "doesn't care about the order of equality comparison" do
  #     @list2.eql?(@list1).must_equal true
  #   end

  #   it 'returns false when lists are different lengths' do
  #     @list1.pop
  #     @list1.eql?(@list2).must_equal false
  #   end

  #   it 'returns false if an element differs' do
  #     @list1.pop
  #     @list1.push 'nope'
  #     @list1.eql?(@list2).must_equal false
  #   end
  # end
end
