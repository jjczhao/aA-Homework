require_relative "tree_node"

class KnightPathFinder
    attr_reader :root_node
    def self.valid_moves(pos)
        possible_positions = [[-2,-1], [-1,-2], [-2,1],[-1,2],[1,-2],[2,-1],[2,1],[1,2]]
        possible_positions.map do |unit_position|
            row = pos[0] + unit_position[0] 
            col = pos[1] + unit_position[1]
            row.between?(0,8) && col.between?(0,8) ? [row, col] : nil
        end
    end


    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [@root_node]
        build_move_tree
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_moves.select! do |position|
            index = @considered_positions.index do |node|
                node.value == position
            end

            not(position.nil?) && not(index)
        end
        possible_moves.map!{|position| PolyTreeNode.new(position)}
        @considered_positions.push(*possible_moves)
        possible_moves
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            n_pos = queue.shift
            possible_moves = new_move_positions(n_pos.value)
            possible_moves.each do |possible_move|
                possible_move.parent = n_pos
            end
            queue.push(*possible_moves)
        end
    end

    def find_path(end_pos)
        node = @root_node.bfs(end_pos)
        trace_path_back(node)
    end

    def trace_path_back(node)
        result = []
        while node
            result.unshift(node)
            node = node.parent
        end
        result
    end
end