class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name_1 = name1
    @name_2 = name2
    @cups = place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    Array.new(14) do |index|
      if index == 6 || index == 13
        []
      else
        Array.new(4){:stone}
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos.between?(0,13)
      return true unless @cups[start_pos].empty?
      raise "Starting cup is empty"
    else
      raise "Invalid starting cup" unless start_pos.between?(0,13)
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    current_pos = start_pos
    until stones.empty?
      current_pos = (current_pos + 1) % 14
      if (current_player_name == @name_1 && current_pos == 13) || (current_player_name == @name_2 && current_pos == 6)
        next
      else
        @cups[current_pos] << stones.shift
      end
    end
    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return @cups[ending_cup_idx].length == 1 ? :switch : ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    top_side = @cups[7..12].all?(&:empty?)
    bottom_side = @cups[0..5].all?(&:empty?)
    top_side || bottom_side
  end

  def winner
    result = @cups[6].length <=> @cups[13].length
    if result == 0
      return :draw
    elsif result == 1
      return @name_1
    else
      return @name_2
    end
  end
end
