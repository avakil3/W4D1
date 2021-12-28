require_relative 'piece'
# require_relative 'slideable'
require 'singleton'


class NullPiece < Piece
  include Singleton
    attr_accessor  :color
  def initialize(color = nil,board = nil,pos = nil)
    super
  end

  def symbol
    ' '
  end

end