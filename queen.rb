class Queen < Piece
  prepend SlidingPiece
  def move_dirs
    [
      [0, -1],
      [0, 1],
      [1, 0],
      [-1, 0],
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ]
  end

  def to_s
    queen = "\u2655".encode('utf-8')
    " #{queen} "
  end

end
