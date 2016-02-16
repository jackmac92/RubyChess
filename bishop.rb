class Bishop < Piece
  prepend SlidingPiece

  def move_dirs
    [
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ]
  end

  def to_s
    bishop = "\u2657".encode('utf-8')
    " #{bishop} "
  end

end
