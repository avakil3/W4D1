require_relative "piece.rb"
require "byebug"
class Board
    def initialize
        @rows = Array.new(8) {Array.new(8,nil)}
        @null_piece = NullPiece
    end

    def [](pos)
        row,col = pos
        @grid[row][col]
    end

    def []=(pos,value)
        row,col = pos
        @grid[row][col] = value
    end
    
    def move_piece(color,start_pos,end_pos)
        piece = self[start_pos]
        if self[end_pos].nil? || color != self[end_pos].color
            self[end_pos] = piece
            self[start_pos] = NullPiece

        end
        
        
    end

    def place_pieces
        #fill @grid with 
    end


    def board_print
        #debugger
        @rows.each do |row|
           # debugger
            row.each do |piece|
               # debugger
                print piece.type.to_s + " "
            end
            puts 
        end
        return ""
    end
end