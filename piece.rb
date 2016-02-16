class Piece
  attr_reader :color, :pos

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
    board[pos] = self
  end

  def pos=(dest)
    board[pos] = nil
    board[dest] = self
    @pos = dest
  end

  def valid_move?(pos)
    @board.in_bounds?(pos) &&
    (@board[pos].nil? || @board[pos].color != self.color)
  end

  def valid_moves
    result = []
    moves.each do |move|
      result << move unless self.move_into_check?(move)
    end
    result
  end

  def move_into_check?(move)
    duped_board = board.dup
    duped_board.move(self.pos, move, true)
    duped_board.in_check?(self.color)
  end

  def dup(new_board)
    self.class.new(self.pos.dup, new_board, self.color)
  end

  protected
  attr_reader :board

end
