class Piece
  attr_accessor :pos
  attr_reader :color

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
    board[pos] = self
  end

  # def to_s
  #   if nil?
  #     " "
  #   else
  #     " "
  #   end
  # end

  def valid_move?(pos)
    # debugger
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
    duped_board.move(self.pos, move)
    duped_board.in_check?(self.color)
  end

  def dup(new_board)
    self.class.new(self.pos.dup, new_board, self.color)
  end

  def to_s
    "#{self.class.to_s[0..1]}"
  end

  protected
  attr_reader :board

end
