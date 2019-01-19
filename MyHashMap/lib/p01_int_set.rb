require 'byebug' 

# it initializes with some max, which is the max number of items that can be stored in the set
# if someone tries to use the insert method, to add more than the max, we give an error
# remove and include look right at the index 0(1) 
# 

# -------------------- 
# MAX INTEGER SET 
# -------------------- 
class MaxIntSet 
  def initialize(max) 
    @store = Array.new(max) { false } 
    @max = max 
  end 

  def insert(num) 
    @store[num] = true unless @store.include?(num)
    raise 'Out of bounds' if num > @max || num < 0
  end 

  def remove(num) 
    @store[num] = false unless @store.include?(num)
    # if !@store.include?(num)
    #   @store[num] = false
    # end
  end 

  def include?(num) 
    @store[num]
  end 

  private 

  def is_valid?(num) 

  end 

  def validate!(num) 
  end 
end 

# -------------------- 
# INTEGER SET 
# -------------------- 
class IntSet 
  def initialize(num_buckets = 20) 
    @store = Array.new(num_buckets) { Array.new } 
  end 

  def insert(num) 
    @store[num % num_buckets] << num unless @store.include?(num)
  end 

  def remove(num) 
    @store[num % num_buckets].delete(num)
  end 

  def include?(num) 
    @store[num % num_buckets].each do |el|
      return true if el == num
    end
    false
  end 

  private 

  def [](num) 
    # optional but useful; return the bucket corresponding to `num` 
  end 

  def num_buckets 
    @store.length 
  end 
end 

# -------------------- 
# RESIZING INTEGER SET 
# -------------------- 
class ResizingIntSet 
  attr_reader :count 

  def initialize(num_buckets = 20) 
    @store = Array.new(num_buckets) { Array.new } 
    @count = 0 
  end 

  def insert(num) 
    # debugger 
    # check if adding that element; look at store before adding 
    resize! if count == num_buckets 

    unless self.include?(num) 
      self[num].concat([num]) 
      @count += 1 
    end 
  end 

  def remove(num) 
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end 

  def include?(num) 
    self[num].any? { |el| el == num } 
  end 

  private 

  def [](num) 
    # optional but useful; return the bucket corresponding to `num` 
    @store[num % num_buckets] 
  end 

  def num_buckets 
    @store.length 
  end 
  
  def resize! 
    old_num_buckets = @store.length 
    new_num_buckets = @store.length * 2 

    # @store += Array.new(old_num_buckets) {[]}
    new_store = Array.new(new_num_buckets) {[]}
    
    @store.each_with_index do |old_bucket, i| 
      # byebug
      old_bucket.each do |val| 
        new_bucket_index = val % new_num_buckets 
        new_store[new_bucket_index] << val 
      end 
    end 
    @store = new_store
  end 
end 
