require_relative 'piece'
require 'colorize'
class Pawn < Piece
 

  def symbol
    '♙'.colorize(color)
  end

  protected

  def move_diffs
    # return an array of diffs representing where a pawn can step to
  end
end