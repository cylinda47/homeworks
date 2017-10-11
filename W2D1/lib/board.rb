class Board
  attr_accessor :cups

  #if last stone ends in last cup -> can go again
  #go until there is no stone or in your point cup

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      case i
        when 0..5, 7..12
          cup.concat([:stone]*4)
        end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)

      end_pos = start_pos + @cups[start_pos].length

      @cups[start_pos].clear
      skip = 6
      skip = 13 if current_player_name == @name1

      skip_count = 0

      (start_pos+1..end_pos).each do |i|
        idx = (i + skip_count) % 14
        if idx == skip
          skip_count += 1
          idx = (i + skip_count) % 14
        end
        @cups[idx].concat([:stone])
      end

      render
      next_turn((end_pos + skip_count) % 14)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13

    if @cups[ending_cup_idx].empty?
      return :switch
    else
      return ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?{ |cup| cup.empty? } ||
    @cups[7..12].all?{ |cup| cup.empty? }
  end

  def winner
    if @cups[6].count == @cups[13].count
      return :draw
    elsif @cups[6].count > @cups[13].count
      return @name1
    else
      return @name2
    end
  end
end
