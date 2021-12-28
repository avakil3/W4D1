require_relative "piece.rb"
require "byebug"
class Board
    def initialize
        @rows = Array.new(8) {Array.new(8,nil)}
        @null_piece = NullPiece
    end

    def [](pos)
        row,col = pos
        @rows[row][col]
    end

    def []=(pos,value)
        row,col = pos
        @rows[row][col] = value
    end
    
    def move_piece(color,start_pos,end_pos)
        piece = self[start_pos]
        if self[end_pos].nil? || color != self[end_pos].color
            self[end_pos] = piece
            self[start_pos] = NullPiece
        end
    end

    def valid_pos?(pos)
        row, col = pos
        (row >= 0 && row < 8 && col >= 0 && col < 8)
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def checkmate?(color)
        king.color == color && king.valid_moves.empty?
    end

    def in_check?(color)
        
    end

    def find_king(color)
        (0...@rows.length).each do |i|
            (0...@rows.length).each do |i2|
                return [i,i2] if @rows[i][i2].is_a?(King) && @rows[i][i2].color == color
            end 
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