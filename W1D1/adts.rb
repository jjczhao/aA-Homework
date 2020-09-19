class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end
end


class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

class Map
    def initialize
        @map = []
    end


    def set(key, value)
        index = find(key)
        if index
            @map[index] = [key, value]
        else
            @map.push([key,value])
        end
    end

    def get(key)
        index = find(key)
        if index
            return @map[index][1]
        end
        nil
    end

    def delete(key)
        index = find(key)
        if index
            @map.delete_at(index)
            return true
        end
        false
    end

    def show
        print @map
    end

    private 
    def find(key)
        @map.each_with_index do |key_val, index|
            return index if key_val[0] == key
        end
        nil
    end
end