require "./board.rb"
require "./display.rb"
require "./player.rb"
require "./exceptions.rb"
require "./piece.rb"
require "./sliding_piece.rb"
require "./bishop.rb"
require "./rook.rb"
require "./queen.rb"
require "byebug"
a = Board.new
b = Bishop.new([0,0],a)
