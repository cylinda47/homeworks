def quadratic_biggest_fish(fishes)
  longest = nil
  (0...fishes.length).each do |x|
    (x+1...fishes.length).each do |y|
      if fishes[x] > fishes[y]
        longest = fishes[x]
      else
        longest = fishes[y]
      end
    end
  end
  longest
end

class Array
  def merge_sort(&prc)
    if self.length <= 1
      return self
    end

    prc ||= Proc.new(|x,y| x <=> y)

    mid = self.length/2

    sorted_left = self.take(mid).merge_sort(&prc)
    sorted_right = self.drop(mid).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << right.shift
      when 1
        merged << right.shift
      end
    end
    merged = left + right
  end
end

def linearithmic_biggest_fish
  longest = ""
  fishes.each do |fish|
    longest < fish if fish.length > longest.length
  end
  longest
end

def slow_dance(dir, arr)
  arr.each do |el|
    return el if el == dir
  end
  nil
end

new_tiles = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(dir, new_tiles_data_structure)
  new_tiles_data_structure[dir]
end
