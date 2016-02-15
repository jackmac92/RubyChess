class Piece

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  # def to_s
  #   if nil?
  #     " "
  #   else
  #     " "
  #   end
  # end

  def valid_move?(pos)
    @board.in_bounds?(pos) &&
    (@board[pos].nil? || @board[pos].color != self.color)
  end

  protected
  attr_reader :pos, :color, :board

end
