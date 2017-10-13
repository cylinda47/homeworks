class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if count > @size
      @cache.shift(el)
      @cache.push(el)
    elsif @cache.include?(el)
      @cache.delete(el)
      @cache.push(el)
    else
      @cache.push(el)
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
  end

  private
  # helper methods go here!

end
