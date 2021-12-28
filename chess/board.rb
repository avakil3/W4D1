require_relative "piece.rb"
require_relative "pieces.rb"
require "byebug"
class Board
    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) {Array.new(8,@null_piece)}
        self.populate
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
            piece.pos = end_pos
            self[start_pos] = @null_piece
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
        king_pos = self.find_king(color)
        (0...@rows.length).each do |i|
            (0...@rows.length).each do |i2|
               return true if @rows[i][i2] != @null_piece && @rows[i][i2].valid_moves.include?(king_pos)
            end
        end
        return false
    end

    def find_king(color)
        (0...@rows.length).each do |i|
            (0...@rows.length).each do |i2|
                return [i,i2] if @rows[i][i2].is_a?(King) && @rows[i][i2].color == color
            end 
        end 
    end

    def populate 
        # first populate everything with NullPieces
        # have method to fill in first  and last rows (take in color as an argument)
        # have method to fill in back pawn rows
        
        (0...@rows.length).each do |row|
            (0...@rows.length).each do |col|
                if row == 0
                    if col == 0 || col == 7
                            @rows[row][col] = Rook.new(:blue,self,[row,col]) 
                    elsif col == 1 || col == 6
                        @rows[row][col] = Knight.new(:blue,self,[row,col])
                    elsif col == 2 || col == 5
                        @rows[row][col] = Bishop.new(:blue,self,[row,col])
                    elsif col == 3
                        @rows[row][col] = King.new(:blue,self,[row,col])
                    elsif col == 4
                        @rows[row][col] = Queen.new(:blue,self,[row,col])
                    end
                elsif row == 1
                    @rows[row][col] = Pawn.new(:blue,self,[row,col]) 
                elsif (2..5).include?(row)
                    @rows[row][col] = @null_piece 
                elsif row == 6
                    @rows[row][col] = Pawn.new(:white,self,[row,col]) 
                elsif row == 7
                    if col == 0 || col == 7
                            @rows[row][col] = Rook.new(:white,self,[row,col]) 
                    elsif col == 1 || col ==  6
                        @rows[row][col] = Knight.new(:white,self,[row,col])
                    elsif col == 2 ||  col == 5
                        @rows[row][col] = Bishop.new(:white,self,[row,col])
                    elsif col == 3
                        @rows[row][col] = King.new(:white,self,[row,col])
                    elsif col == 4
                        @rows[row][col] = Queen.new(:white,self,[row,col])
                    end
                end
            end
        end
    end


    def board_print
        #debugger
        @rows.each do |row|
           # debugger
            row.each do |piece|
               # debugger
                print piece.symbol.to_s + "  "
            end
            puts 
        end
        return ""
    end
end