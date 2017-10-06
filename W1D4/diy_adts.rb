class Stack
  attr_reader :stack

  def initialize
    # create ivar to store stack here!
    stack = []
  end

  def add(el)
    # adds an element to the stack
    stack << el
    el
  end

  def remove
    # removes one element from the stack
    stack.pop
  end

  def show
    # return a copy of the stack
    stack.dup
  end
end

class Queue
  attr_reader :queue

  def initialize
    queue = []
  end

  def enqueue(el)
    queue << el
    el
  end

  def dequeue
    queue.shift
  end

  def show
    queue.dup
  end
end

class Map
  def initialize
    @sets = []
  end

  def assign(key, value)
    key_idx = lookup(key)
    if key_idx.empty?
      @sets << [key, value]
    elsif key_idx.length == 1
      @sets [key_idx[0]][1] = value
    end
  end

  def lookup(key)
    pos = []
    @sets.each_with_index do |set, idx|
      set.each do |el|
        pos << idx if el == key
      end
    end
    pos
  end

  def remove(key)
    key_idx = lookup(key)
    @sets.delete_at(key_idx[0])
  end

  def show
    @sets.dup
  end
end
