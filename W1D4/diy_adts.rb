class Stack
  attr_reader :stack

  def initialize
    # create ivar to store stack here!
    stack = []
  end

  def add(el)
    # adds an element to the stack
    stack << el
    el=
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
    # create ivar to store stack here!
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
