require "./exceptions"
class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) { "   " } }

  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end


  def move(start_pos, end_pos)
    piece = self[start_pos]
    raise ChessGameError.new("No piece at #{start_pos}") if piece.nil?
    #raise ChessGameError.new("Invalid move at end_pos") if can't move to end_pos
    self[end_pos] = piece
    self[start_pos] = nil
  end
end
