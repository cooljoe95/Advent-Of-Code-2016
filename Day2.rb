class Keypad
    def initialize(pos = [1, 1], board = [[1,2,3], [4,5,6], [7,8,9]])
        @pos = pos
        @board = board
    end
    
    def move(&prc)
        prev = @pos.dup
        prc.call
        unless valid_move?(@pos)
            @pos = prev
        end
    end
    
    def move_U
        move{ @pos[0] -= 1 }
    end
    
    def move_D
        move{ @pos[0] += 1}
    end
    
    def move_L
        move{ @pos[1] -= 1 }
    end
    
    def move_R
        move{ @pos[1] += 1 }
    end
    
    def num
        @board[@pos[0]][@pos[1]]
    end
    
    def valid_move?(pos)
        return false if pos[0] < 0 or pos[1] < 0
        return false unless @board[pos[0]]
        return false unless @board[pos[0]][pos[1]]
        @board[pos[0]][pos[1]] != 0
    end
end

keypad = Keypad.new(pos = [2,0], board = [  
            [0,0,1,0,0], 
            [0,2,3,4,0], 
            [5,6,7,8,9], 
            [0, 'A', 'B', 'C', 0], 
            [0,0,'D',0,0]
            ]
    )
final = ""
while s = gets
    s = s.chomp
    s.chars.each do |el|
        keypad.send("move_#{el}")
    end
    final += keypad.num.to_s
end
puts final
