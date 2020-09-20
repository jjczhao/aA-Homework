class PolyTreeNode
    attr_accessor :value, :children, :parent
    def initialize(val)
        @value = val
        @children = []
        @parent = nil
    end

    def parent=(parent_node)
        if @parent
            @parent.children.delete(self)
        end
        @parent = parent_node
        @parent.children << self unless parent_node.nil?
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        unless children.include?(child_node)
            raise "Node is not a children"
        end
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if value == target_value
        children.each do |child|
            found_child = child.dfs(target_value)
            return found_child if found_child
        end
        nil
    end


    def bfs(target_value)
        queue = [self]
        until queue.empty?
            node = queue.shift
            return node if node.value == target_value
            queue.push(*node.children)
        end
        nil
    end

    def inspect
        @value.inspect
    end
end