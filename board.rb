class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }

  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def dup
    new_board = Board.new
    new_board.grid = @grid.map do |row|
      row.dup.map do |piece|
        piece.dup(new_board) unless piece.nil? # need to duplicate piece itself
      end
    end
    new_board
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def flattened_board
    self.grid.flatten
  end


  def move(start_pos, end_pos, duped_checking = false) #duped_checking prevents recursive calls when duped board is checking potential move
    piece = self[start_pos]

    unless duped_checking
      raise ChessGameError.new("Invalid move to #{end_pos}, try again") unless piece.valid_moves.include?(end_pos)
    end
    raise ChessGameError.new("No piece at #{start_pos}, try again") if piece.nil?

    piece.pos = end_pos
  end

  def in_check?(color)
    opponent = color == :white ? :black : :white
    opponent_pieces = flattened_board.select do |piece|
      piece && piece.color == opponent
    end
    king_pos = flattened_board.select do |piece|
      piece.is_a?(King) && piece.color == color
    end[0].pos
    opponent_pieces.any? { |piece| piece.moves.include?(king_pos) }
  end

  def check_mate?(color)
    pieces = flattened_board.select { |piece| piece && piece.color == color }
    pieces.none? { |piece| piece.valid_moves.size > 0 }
  end

end
