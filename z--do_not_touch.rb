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
  end 

  def insert(num) 
    raise 'Out of bounds' if num > store.length || num < 0 
    store[num] = true unless self.include?(num) 
  end 

  def remove(num) 
    store[num] = false 
  end 

  def include?(num) 
    store[num] 
  end 

  private 

  attr_reader :store 

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
    store[num % num_buckets] << num unless self.include?(num) 
  end 

  def remove(num) 
  end 

  def include?(num) 
    store[num % num_buckets].each do |value| 
      return true if value == num 
    end 

    false 
  end 

  private 

  attr_reader :store 

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
  end 

  def remove(num) 
  end 

  def include?(num) 
  end 

  private 

  def [](num) 
    # optional but useful; return the bucket corresponding to `num` 
  end 

  def num_buckets 
    @store.length 
  end 

  def resize! 
  end 
end 
