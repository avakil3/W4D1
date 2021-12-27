require "byebug"

class Piece
    
    attr_accessor :type, :color
    def initialize(type,color)
        @type = type # King, Queen, Bishop...
        @color = color
    end

end

class NullPiece < Piece
    attr_accessor :type, :color
  def initialize(type)
    #debugger
    super
  end
end