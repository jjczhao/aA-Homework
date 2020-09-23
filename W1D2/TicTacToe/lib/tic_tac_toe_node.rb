require_relative 'tic_tac_toe'
require "byebug"



class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return @board.won? && @board.winner != evaluator
    end

    if evaluator == @next_mover_mark
      return self.children.all?{|child| child.losing_node?(evaluator)}
    else
      return self.children.any?{|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.winner == evaluator
    end

    if evaluator == @next_mover_mark
      return self.children.any?{|child| child.winning_node?(evaluator)}
    else
      return self.children.all?{|child| child.winning_node?(evaluator)}
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_moves = []
    (0...3).each do |x|
      (0...3).each do |y|
        if @board.empty?([x,y])
          board_dup = @board.dup
          current_pos = [x,y]
          board_dup[current_pos] = @next_mover_mark
          next_mark = prev_move_pos.nil? ? :o : board_dup[@prev_move_pos]
          node = TicTacToeNode.new(board_dup,next_mark,current_pos)
          possible_moves << node
        end
      end
    end
    possible_moves
  end
end
